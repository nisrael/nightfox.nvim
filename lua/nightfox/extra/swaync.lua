local template = require("nightfox.util.template")

local M = {}

function M.generate(spec, _)
  local content = [[
/**
 * Nightfox colors for SwayNC
 * name: ${palette.meta.name}
 * upstream: ${palette.meta.url}
 */

@define-color bg ${bg1};
@define-color bg-hover ${bg2};
@define-color bg-focus ${sel0};
@define-color bg-urgent ${palette.red};
@define-color text ${fg1};
@define-color text-sub ${fg2};
@define-color border ${bg3};
@define-color accent ${palette.blue};
@define-color accent-hover ${palette.magenta};
@define-color close ${palette.red};
@define-color green ${palette.green};
@define-color teal ${palette.yellow};

* {
  font-family: monospace;
  font-weight: bold;
  font-size: 14px;
}

.control-center {
  background: @bg;
  border: 2px solid @border;
  border-radius: 12px;
  margin: 6px;
  padding: 8px;
}

.control-center .notification-row {
  margin: 0;
  padding: 0;
}

.control-center .notification-row .notification-background {
  margin: 4px 0;
}

.notification {
  background: @bg-hover;
  border: 1px solid @border;
  border-radius: 8px;
  margin: 4px;
  padding: 0;
}

.notification .notification-content {
  padding: 8px;
}

.notification .summary {
  color: @text;
  font-size: 14px;
}

.notification .body {
  color: @text-sub;
  font-size: 13px;
}

.notification .time {
  color: @text-sub;
  font-size: 11px;
}

.notification.critical {
  border: 1px solid @bg-urgent;
}

.notification .close-button {
  background: transparent;
  color: @close;
  border: none;
  border-radius: 6px;
  padding: 2px;
  margin: 4px;
}

.notification .close-button:hover {
  background: @bg-focus;
}

.notification .notification-action {
  background: @bg-focus;
  color: @accent;
  border: 1px solid @border;
  border-radius: 6px;
  margin: 4px 2px;
  padding: 4px 8px;
}

.notification .notification-action:hover {
  background: @border;
  color: @text;
}

.notification .notification-default-action {
  background: transparent;
  border-radius: 8px;
  margin: 0;
  padding: 0;
}

.notification .notification-default-action:hover {
  background: @bg-focus;
}

.notification .image {
  border-radius: 6px;
  margin-right: 8px;
}

/* Control center widgets */
.widget-title {
  color: @accent;
  font-size: 16px;
  margin: 4px 8px;
}

.widget-title > button {
  background: @bg-focus;
  color: @close;
  border: 1px solid @border;
  border-radius: 6px;
  padding: 2px 10px;
}

.widget-title > button:hover {
  background: @close;
  color: @bg;
}

.widget-label {
  color: @text-sub;
  margin: 2px 8px;
}

.widget-dnd {
  margin: 4px 8px;
}

.widget-dnd > switch {
  background: @bg-focus;
  border: 1px solid @border;
  border-radius: 12px;
}

.widget-dnd > switch:checked {
  background: @accent;
}

.widget-dnd > switch slider {
  background: @text;
  border-radius: 50%;
}

.widget-mpris {
  background: @bg-hover;
  border: 1px solid @border;
  border-radius: 8px;
  margin: 4px 8px;
  padding: 8px;
}

.widget-mpris .widget-mpris-title {
  color: @text;
  font-size: 14px;
}

.widget-mpris .widget-mpris-subtitle {
  color: @text-sub;
  font-size: 12px;
}

.widget-mpris button {
  background: transparent;
  color: @accent;
  border: none;
  border-radius: 6px;
  padding: 4px;
}

.widget-mpris button:hover {
  background: @bg-focus;
}

.widget-buttons-grid {
  margin: 4px 8px;
}

.widget-buttons-grid > flowbox > flowboxchild > button {
  background: @bg-focus;
  color: @text;
  border: 1px solid @border;
  border-radius: 8px;
  padding: 8px;
  margin: 2px;
}

.widget-buttons-grid > flowbox > flowboxchild > button:hover {
  background: @border;
}

.widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
  background: @accent;
  color: @bg;
}
]]

  return template.parse_template_str(content, spec)
end

return M
