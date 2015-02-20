# Notes on data structures

Notes for myself; may not make sense to you.

## Bloom Filters

You want to know if X is in a set of things. If you keep the entire set, you can check all of them and know for sure. A Bloom filter keeps a much smaller representation of the set in memory. The tradeoff is that it can't tell you for sure if something *is* in the set, only for sure if it's *not*; it answers either "no" or "probably". Getting "probably" can be the cue to do a much more accurate (but expensive) test to find out for sure - a network request, disk lookup, etc.

Analogy: footprints in the snow. If we see cat and bird prints only, we know that Mr. Jones has not been here. If we see boot prints like his, we only know that he *may* have been here, so it's worth finding witnesses, camera footage, etc.

Applications: is this URL or email address one of a set of known spammy ones? Is this a correctly-spelled word? Is this license plate associated with a criminal?
