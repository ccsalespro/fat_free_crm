# Fat Free CRM
# Copyright (C) 2008-2011 by Michael Dvorkin
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#------------------------------------------------------------------------------

module UsersHelper

  def language_for(user)
    if user.preference[:locale]
      locale, language = languages.detect{ |locale, language| locale == user.preference[:locale] }
    end
    language || "English"
  end

  def sort_by_language
    languages.sort.map do |locale, language|
      %Q[{ name: "#{language}", on_select: function() { #{redraw(:locale, [ locale, language ], url_for(:action => :redraw, :id => current_user))} } }]
    end
  end

  def user_select(asset, users, myself)
    user_options = user_options_for_select(users, myself)

    include_blank = t(:unassigned) if myself.admin?

    select(asset, :assigned_to, user_options,
           { :include_blank => include_blank },
           { :style         => "width:160px"  })
  end



  def user_options_for_select(users, myself)

    # Do not show non-admins any other users.
    # Show group leaders members of their groups
    # Kind of ugly, but at least a common point to wedge it in.
    filtered_users = if myself.admin?
      users
    elsif myself.group_leader?
      myself.groups.map(&:users).flatten.uniq
    else
      []
    end
    filtered_users.map { |u| [u.full_name, u.id] }.sort.prepend([t(:myself), myself.id])
  end
end
