# ember-2.0-upgrade-scripts

Scripts to help upgrading a big Ember app from 1.x to 2x

## Replace bind-attr

```
find . -iname '*.ember.hbs*' -exec sh -c 'replace-bind-attr.rb "$1" | sponge "$1"' -- {} \;  
```
