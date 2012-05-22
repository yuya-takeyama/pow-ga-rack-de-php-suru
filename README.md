らっくでぱうしてぺちぺする
==========================

PHP によるウェブ開発をカジュアルに行えるよう、Rack::Legacy により Pow 上で PHP の Web アプリを動かそうというもの。

Rack とは
---------

Ruby にいて Web サーバと Web アプリケーションの間を繋ぐインターフェイス。CGI よりもより上位で、プログラミング言語に依存したインターフェイス。

他言語における同様のインターフェイスとして、Python の WSGI や Perl の PSGI 等が挙げられる。  
Haskell にも WAI、Clojure には Ring があり Common Lisp には Clack がある。  

サーバとフレームワークのグルー (糊) としての役割の他に、ミドルウェアのインターフェイスを定義することで、フレームワークを超えて再利用性の高いライブラリの開発を促すという利点もある。

### ところで PHP は？

今どきの言語で上記のようなインターフェイスが使われていないのは PHP ぐらいなのでは無いか...

そういうものを作(ろうとした|った|っている)人は何人かいないこともない。

- [Phack](http://www.youtube.com/watch?v=xnw0TljGX6I)
- [Phunk](https://github.com/kuzuha/Phunk)
- [Pod](https://github.com/CHH/pod)

とはいえ $\_GET や $\_POST などは mod\_php/CGI/FastCGI 問わず使え、これらのスーパーグローバル変数が同様の役割を果たしているとも言える。

Pow とは
--------

Mac OS X 専用の Rack アプリケーション開発サーバ。  
Rack アプリケーションであれば何でもいいので、Rails も Sinatra も Padrino も動く。

$HOME/.pow ディレクトリに example という名前でシンボリックリンクを作成すると、example.dev という TLD でアクセスでき、ブラウザ上でアプリケーションが実行できる。

Apache の VirtualHost を書くような面倒な作業が全くいらずにいくらでも開発環境を作れるので、Ruby の Web アプリケーション開発には重宝されている (らしい) 。

PHP にも Pow 的な何かが欲しい！！
---------------------------------

Pow それ自体でいいのです。

どうやるか
----------

Pow 上で Rack アプリケーションとして PHP アプリケーションを実行すれば良い。  
rack-legacy という gem を利用すればできる。

さんこうにしたあれこれ
----------------------

- [PHP のテストを Ruby で書く](http://blog.udzura.jp/2011/08/09/writing-php-test-by-ruby/)
- [danott/phpow](https://github.com/danott/phpow)

かいたひと
----------

[Yuya Takeyama](http://yuyat.jp)
