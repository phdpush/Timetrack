module ApplicationHelper

def render_flash
  rendered = []
  flash.each do |type, messages|
    rendered << messages
  end
  rendered.join('<br/>')
end
end
