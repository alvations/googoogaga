from __future__ import print_function
import sys

import MeCab
import romkan

mecab = MeCab.Tagger ("-Ochasen")

def parse(text):
    for token in mecab.parse(text).split('\n'):
        token = token.strip()
        if token == 'EOS':
            return
        else:
            surface, katakana, lemma, *pos = token.split('\t')
            yield surface, romkan.to_roma(katakana), katakana, lemma

if __name__ == "__main__":
    with open(sys.argv[1]) as fin:
        for line in fin:
            text = ' '.join(line.strip().split())
            surface_words, romanization, katakanas, lemmas = zip(*parse(text))
            print('\t'.join([' '.join(surface_words), ' '.join(romanization), 
                             ' '.join(katakanas)])
                 )
