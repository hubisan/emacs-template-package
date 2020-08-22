# {{{pgk-name}}}

TODO Short description.

## Main Features

TODO Describe main features.

## Extensions

!!! warning "Remove section"
    This section is only here to show the features you can use while writing the
    documentation with the extensions.

### Markdown extensions

All available extensions are listed in the
[sitemap](https://python-markdown.github.io/sitemap.html). This explains the
enabled ones.

#### Admonition

You can use the following classes including synonyms:
- note, seealso
- important, hint, tip
- warning, caution, attention
- danger, error

``` markdown
!!! danger "Don't try this at home"
    ...
```

!!! danger "Don't try this at home"
    ...

#### Attr_list (HTML Attributes)

Add html attributes to elements:

```markdown
This is a paragraph.
{: #an_id .a_class }
```

This is a paragraph.
{: #an_id .a_class }

#### Def_list (Definition Lists)

```markdown
Apple
:   Pomaceous fruit of plants of the genus Malus in
    the family Rosaceae.
```
Apple
:   Pomaceous fruit of plants of the genus Malus in
    the family Rosaceae.

#### Footnotes

``` markdown
Footnotes[^1] have a label[^@#$%] and the footnote's content.

[^1]: This is a footnote content.
[^@#$%]: A footnote on the label: "@#$%".
```

Footnotes[^1] have a label[^@#$%] and the footnote's content.

[^1]: This is a footnote content.
[^@#$%]: A footnote on the label: "@#$%".

#### Meta

Overwrite the title with front matter at top:

``` markdown
---
title: Lorem ipsum dolor sit amet
---
```

### Toc

Used to make a table of contents and to add permalinks to headings.

### Smartypants

The SmartyPants extension converts ASCII dashes, quotes and ellipses to their
HTML entity equivalents:

...
"test"
'test'
<<test>>

## PyMdown Extensions

Showcase for enabled PyMdown [extensions](https://facelessuser.github.io/pymdown-extensions/).

### Details

Collapsible elements that hide their content. See [#admonition](#admonition) for
valid classes, it is actually the same just collapsible.

``` markdown
???+ note "Open styled details"

    ??? danger "Nested details!"
        And more content again.

??? success
    Content.

??? warning classes
    Content.
```

???+ note "Open styled details"

    ??? danger "Nested details!"
        And more content again.

??? success
    Content.

??? warning classes
    Content.

### Highlight

Highlight is an extension that adds support for code highlighting.

### Inlinehilite

``` markdown
Here is some code `#!py3 import pymdownx; pymdownx.__version__`.  
The mock shebang will be treated like text here: `#!js var test = 0;`.
```

Here is some code `#!py3 import pymdownx; pymdownx.__version__`.  
The mock shebang will be treated like text here: `#!js var test = 0;`.

### Magiclink

Makes it easy to set links and converts them:

``` markdown
https://google.com  
fake.email@email.com  
test #1  
backrefs#1  
Python-Markdown/markdown#1  
gitlab:pycqa/flake8#385  
!13  
backrefs!4  
Python-Markdown/markdown!598  
gitlab:pycqa/flake8!213  
@facelessuser  
@twitter:twitter  
```

https://google.com  
fake.email@email.com  
test #1  
backrefs#1  
Python-Markdown/markdown#1  
gitlab:pycqa/flake8#385  
!13  
backrefs!4  
Python-Markdown/markdown!598  
gitlab:pycqa/flake8!213  
@facelessuser  
@twitter:twitter  

### Saneheaders

Used to make headers without a space not be headers:

##test

### Smartsymbols

SmartSymbols adds syntax for creating special characters such as trademarks,
arrows, fractions, etc.

--> 1/4 (c)

### Snippets

Lets you include other files.

### Superfences

Allowing the nesting of fences under blockquotes, lists, or other block elements
(see Limitations for more info). Ability to specify custom fences to provide
features like flowcharts, sequence diagrams, or other custom blocks. Allow
disabling of indented code blocks in favor of only using the fenced variant (off
by default).

> ```
  a fenced block

> with blank lines
  ```
  
```{.python .extra-class linenums="1"}
import hello_world
```
### Tabbed

``` markdown
=== "Tab 1"
    Markdown **content**.

    Multiple paragraphs.

=== "Tab 2"
    More Markdown **content**.

    - list item a
    - list item b
```

=== "Tab 1"
    ```sh
    echo $PATH
    ```
    Markdown **content**.

    Multiple paragraphs.

=== "Tab 2"
    More Markdown **content**.

    - list item a
    - list item b
    
### Tasklist 

``` markdown
- [X] item 1
    * [X] item A
    * [ ] item B
        more text
        + [x] item a
        + [ ] item b
        + [x] item c
    * [X] item C
- [ ] item 2
- [ ] item 3
```

- [X] item 1
    * [X] item A
    * [ ] item B
        more text
        + [x] item a
        + [ ] item b
        + [x] item c
    * [X] item C
- [ ] item 2
- [ ] item 3


