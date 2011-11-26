(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(push '("\\.md" . markdown-mode) auto-mode-alist)
(push '("\\.markdown" . markdown-mode) auto-mode-alist)