# ember-2.0-upgrade-scripts

Scripts to help upgrading a big Ember app from 1.x to 2x

- `replace-bind-attr`: [Replace bind-attr](https://www.emberjs.com/deprecations/v1.x/#toc_bind-attr)
- `replace-controller-needs`: [Replace controller needs](https://www.emberjs.com/deprecations/v1.x/#toc_controller-needs)

## Usage

```
command <file>
```

Commands will output the transformed contents to STDOUT.

You can process multiple files with something like this:

```
find . -iname '*.hbs*' -exec sh -c 'replace-bind-attr.rb "$1" | sponge "$1"' -- {} \;  
```
