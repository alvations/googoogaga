# googoogaga


Install
====

```
sudo apt-get install libmecab-dev mecab mecab-ipadic-utf8
sudo -H pip3 install mecab-python3
sudo -H pip3 install jaconv
sudo -H pip3 install romkan
```


Use
====


```
$ cat inputfile.txt 
缶コーヒー（かんコーヒー）とは、缶に入っていて、すぐに飲むことのできるコーヒー、コーヒー飲料、コーヒー入り清涼飲料、あるいは（コーヒー入りの）乳飲料である。
主に自動販売機やコンビニエンスストアなどで販売されている。
チルドカップやペットボトル入りの製品と総括してレディ・トゥ・ドリンクコーヒーとも呼ばれる。

$ python3 speak.py inputfile.txt
缶 コーヒー （ かん コーヒー ） と は 、 缶 に 入っ て い て 、 すぐ に 飲む こと の できる コーヒー 、 コーヒー 飲料 、 コーヒー 入り 清涼 飲料 、 あるいは （ コーヒー 入り の ） 乳 飲料 で ある 。	kan ko-hi- （ kan ko-hi- ） to ha 、 kan ni haixtsu te i te 、 sugu ni nomu koto no dekiru ko-hi- 、 ko-hi- inryou 、 ko-hi- iri seiryou inryou 、 aruiha （ ko-hi- iri no ） chichi inryou de aru 。	カン コーヒー （ カン コーヒー ） ト ハ 、 カン ニ ハイッ テ イ テ 、 スグ ニ ノム コト ノ デキル コーヒー 、 コーヒー インリョウ 、 コーヒー イリ セイリョウ インリョウ 、 アルイハ （ コーヒー イリ ノ ） チチ インリョウ デ アル 。
主 に 自動 販売 機 や コンビニエンスストア など で 販売 さ れ て いる 。	omo ni jidou hanbai ki ya konbiniensusutoa nado de hanbai sa re te iru 。	オモ ニ ジドウ ハンバイ キ ヤ コンビニエンスストア ナド デ ハンバイ サ レ テ イル 。
チルドカップ や ペットボトル 入り の 製品 と 総括 し て レディ・トゥ・ドリンクコーヒー と も 呼ば れる 。	chirudokappu ya pettobotoru iri no seihin to soukatsu shi te redi・toxu・dorinkuko-hi- to mo yoba reru 。	チルドカップ ヤ ペットボトル イリ ノ セイヒン ト ソウカツ シ テ レディ・トゥ・ドリンクコーヒー ト モ ヨバ レル 
```

Docker Stuff
====

```
git clone https://github.com/alvations/googoogaga.git
cd googoogaga
docker build -t speak . < Dockerfile

# This is the file we want to input.
cat inputfile.txt

INFILE=inputfile.txt
docker run -i -e INFILE=$INFILE speak /bin/bash -c "python3 speak.py $INFILE"
```


