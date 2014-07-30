# Based in part on FoundationRailsHelper by sgruhier (https://github.com/sgruhier/foundation_rails_helper)
# Certain elements of this file are copyright (c) 2012 Sébastien Gruhier and used under the MIT License
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'action_view/helpers'

# Provides a helper method to simplify the display of flash messages and provide the
# necessary markup for the display framework to properly style them.
#
# Presently, Foundation is our display framework. Necessary format for Foundation framework:
# <div class="alert-box [success alert secondary]">
#   This is an alert box.
#   <a href="" class="close">&amp;times;</a>
# </div>
module FlashHelper
  # Allow for views and others to read the list of available flash message categories
  attr_reader :FLASH_KEYS

  # Acceptable flash message categories
  FLASH_KEYS = {
      alert:     :warning,
      notice:    :standard,
      info:      :info,
      secondary: :secondary,
      success:   :success,
      error:     :alert
  }

  # Returns the HTML for pretty display of the flash messages, either in full or for the categories specified.
  #
  # Parameters:
  #
  #   * `keys` - (optional) a subset of +FLASH_KEYS+ categories to display (defaults to all keys in +FLASH_KEYS+)
  #
  # Returns:
  #
  #   * An `html_safe`-ed string with the display markup for the selected categories of flash messages
  def display_flash_messages(keys = {})
    keys = FLASH_KEYS.merge(keys)

    flash.inject '' do |message, (key, value)|
      message += content_tag(:div, { data: { alert: '' }, class: 'alert-box ' << (keys[key.to_sym] || :standard).to_s << ' radius' }) do
        (value.to_s + link_to('&times;'.html_safe, '#', class: :close)).html_safe
      end
    end.html_safe
  end
end