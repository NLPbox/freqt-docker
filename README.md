freqt-docker
============

The FREQT (FREQuent Tree miner) algorithm (Abe et al. 2002; Zaki 2002) efficiently extracts
frequent ordered-sub-trees from a set of ordered-trees (i.e. a forest database).
Frequent means that a sub-tree occurs in no less than N trees, where N is a user 
given threshold usually called minimum support.

[FREQT](http://chasen.org/~taku/software/freqt/) efficiently enumerates frequent sub-trees
using right-most expansion. This repository allows you to install the software in a
[docker](https://www.docker.com/) container with one simple command.


Installation
============

``docker build -t freqt https://github.com/nlpdocker/freqt-docker.git``


Usage
=====

```bash
# makes your /tmp directory available in the container
docker run -v /tmp:/tmp -ti freqt

# example taken from http://chasen.org/~taku/software/freqt/
root@02f08a7bd50e:/opt/freqt-0.22# cat /tmp/input.freqt 
;; this is an example
(S(NP(I))(VP(saw)(NP(a)(girl))(PP(with)(NP(a)(telescope))))(.))
(S(NP(He))(VP(saw)(NP(the)(boy))(PP(with)(NP(this)(camera))))(.))
(S(NP(I))(VP(go)(PP(to)(NP(this)(hotel))))(.))
(S(NP(She))(VP(finds)(NP(a)(mistake))(PP(in)(this)(paper)))(.))

# look for patterns (nodes with size >=3) which occur at least 4 times
root@02f08a7bd50e:/opt/freqt-0.22# freqt -m 4 -M 3 < /tmp/input.freqt 
4 4 3 (S(NP)(.))
4 4 3 (S(NP)(VP))
4 4 4 (S(NP)(VP)(.))
4 4 4 (S(NP)(VP(PP)))
4 4 5 (S(NP)(VP(PP))(.))
4 4 3 (S(VP)(.))
4 4 3 (S(VP(PP)))
4 4 4 (S(VP(PP))(.))
```


Publications
============

[1] Kenji Abe, Shinji Kawasoe, Tatsuya Asai, Hiroki Arimura, Setsuo Arikawa, [Optimized Substructure Discovery for Semi-structured Data](http://dx.doi.org/10.1007/3-540-45681-3_1), Proc. 6th European Conference on Principles and Practice of Knowledge Discovery in Databases (PKDD-2002), LNAI 2431, Springer-Verlag, 1-14, August 2002.  
[2] Mohammed J. Zaki, [Efficiently Mining Frequent Trees in a Forest](http://www.cs.rpi.edu/~zaki/PaperDir/PS/SIGKDD02-tree.pdf), 8th ACM SIGKDD International Conference on Knowledge Discovery and Data Mining, July 2002.
