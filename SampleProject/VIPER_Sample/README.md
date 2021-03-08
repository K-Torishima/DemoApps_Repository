#  VIPER_Sample

このリポジトリはVIPERアーキテクチャのSampleである

## VIPERとは
- Clean ArchitectureをiOS用に変えたもの
主な構成

- V：View . ViewController
- I：Interactor
- P：Presenter
- E：Entity
- R：Router

「View」は画面要素を管理するクラス（ViewController)
「Interacter」は外部データの取得、更新を行い、「Presenter」に結果を返す役割
「Presenter」は「Interactor」にデータ取得等の仕事を依頼し、「View」に結果を返す、また画面遷移を「Router」に依頼する全体のハブ的な役割にあたる

「Entity」はデータ構造そのものを示し、通常は「struct」で定義することが多い、あまりロジック的なメソッドは含めず、JSON形式からの変換などの最小限のメソッドに留める

「Router」は画面遷移を担う、通常、View Controllerが行う処理の代わりに行う


## VIPERの基本ルール
VIPERには2つの重要なルールがある

### 1
Entityを除いた各クラスは疎結合を維持するため、「protocol」を定義、継承し、それに準拠した実装を行い、
「protocol」のみに依存することで、お互いが実際は何者であるかわからない状態を維持する

### 2

ViewはPresenterを強参照、presenterはViewを弱参照、InteracterとRouterは強参照 、RouterはViewを弱参照という関係性を作る
依頼する側は依頼者を強参照、依頼される側は依頼主を弱参照する

<image src="https://user-images.githubusercontent.com/52149750/103501749-7b8d9480-4e92-11eb-8995-429823b8fae8.png">

##
参考URL
https://github.com/yururiwork/VIPER_Sample

