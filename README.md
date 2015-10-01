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
