{h} = require 'preact'

export node = (name, args, children) --> h name, args, children

# block
export DIV = node 'div'
export NAV = node 'nav'
export ARTICLE = node 'article'
export HEADER = node 'header'
export SECTION = node 'section'
export FOOTER = node 'footer'
export P = node 'p'
export UL = node 'ul'
export LI = node 'li'
export HR = node 'hr'
export H1 = node 'h1'
export H2 = node 'h2'
export H3 = node 'h3'
export H4 = node 'h4'

# inline
export SPAN = node 'span'
export A = node 'a'

# form
export LABEL = node 'label'
export FORM = node 'form'
export INPUT = node 'input'
export BUTTON = node 'button'
export TEXTAREA = node 'textarea'
export SELECT = node 'select'
export OPTION = node 'option'
