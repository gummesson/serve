# Serve

*Serve* is probably the ugliest static site generator in the world but hey, it gets the job done!

## How it works

*Serve* first scans the content directory (default: `content`) where it reads the content of every single file and parses their filenames. Your content files can have any extension you'd like, the important thing is that they're actually written in [Markdown](http://daringfireball.net/projects/markdown/ "Markdown"). It'll then create the static directory (default: `static`) if it doesn't exist.

After that it'll find the HTML template file in the template directory (default: `template`). It doesn't matter what you've named your template file, but it's important that you only have one HTML file in that specific directory. It'll then parse the content from the content directory  and replace the content delimiter in the HTML template file with the parsed content.

It'll then save each and every file in the static directory (default: `static`) and then copy the CSS file(s) in the template directory to the static directory. It'll also copy JS, PNG, JPG, GIF and ICO files if they're placed in that directory.

### Delimiter

`[CONTENT]` is used as a delimiter in the HTML template to tell *Serve* where to place the parsed Markdown content, like this:

	<div class="content">
	  [CONTENT]
	</div>

Think of it as a poor man's [Liquid](http://liquidmarkup.org/ "Liquid") template engine.

## Usage

	serve [options]

	-c --content     The content directory
	-t --template    The template directory
	-s --static      The static directory

## Dependencies

- [kramdown](http://kramdown.rubyforge.org/ "kramdown")

## License

**The MIT License (MIT)**

*Copyright (c) 2013 Ellen Gummesson*

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
