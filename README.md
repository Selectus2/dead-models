# dead-models

The live demo from "I See Dead Models", a talk about AI features
that fail silently in production, given at Deccan Queen on Rails
(Pune, October 2026).

```
bin/demo
```

It scores a ticket classifier against a 100-example golden set,
prints a report, and exits non-zero because accuracy (0.71) is
below the agreed threshold (0.86). `bundle exec rspec` fails the
same way.

The classifier in `lib/classifier.rb` is a deterministic stub: twenty
keyword rules, first match wins, no match means "other". There is no
model, no API key and no network call, so the demo runs offline and
prints the same thing every time. Its 29 misses are the ones keyword
matching always makes: the right keyword in the wrong ticket, a
substring like "down" inside "downgrade", and wording no rule covers.
Gems are vendored in `vendor/bundle`, so no install step is needed.

[vishwajeetsingh.in](https://vishwajeetsingh.in) ·
[@vishwadesurkar](https://x.com/vishwadesurkar)

MIT licence.
