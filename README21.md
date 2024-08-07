## Step21: 投稿の検索機能

- ブランチ名: feature21/post-search

## ゴール

- ユーザーが投稿を検索できる機能を実装する

## 学習できること

- 検索機能の実装方法
- Rails コントローラーでの検索アクションの作成方法
- ビューでの検索フォームの作成方法
- ルーティングの設定方法

## 実装内容

1. 検索フォームを作成する
2. 検索結果を表示するためのコントローラーとアクションを作成する
3. 検索結果を表示するためのビューを作成する
4. ルーティングを設定する

## チェックリスト

- [ ] 検索フォームの作成

  - 投稿一覧ページの`<h1>`タブの下に検索フォームを追加すること

    ```html
    <%= form_with url: , method: , local: true, class: "mb-6" do %>
    <div class="flex justify-center">
      <%= text_field_tag , , placeholder: "投稿を検索...", class: "form-input
      rounded-l-lg border-gray-300 w-2/3" %> <%= submit_tag "検索", class: "btn
      bg-blue-500 text-white rounded-r-lg" %>
    </div>
    <% end %>
    ```

  - 検索結果がない場合に「検索ワード’○○’はヒットしませんでした」と表示すること

- [ ] 検索結果を表示するためのコントローラーとアクションの作成
  - `app/controllers/posts_controller.rb` に`search` アクションを追加すること
    - 検索フォームから送信された検索ワード（パラメータ）を取得すること
    - 検索ワードが投稿のタイトルや本文に部分一致する条件で検索すること
    - 検索クエリに基づいて、投稿を検索し、その結果を変数に格納すること
    - 検索結果をビューに渡し、投稿一覧として表示すること
    - 検索ワードが空の場合は、全ての投稿を表示すること
- [ ] ルーティングの設定
  - 検索機能のためのルーティングを設定すること
- [ ] 確認
  - ブラウザで投稿一覧ページにフォームが表示されていること
  - キーワードを入力して検索できること
    - 投稿のタイトルで検索できること
    - 投稿の本文で検索できること
    - 検索できなかった場合は「検索ワード’○○’はヒットしませんでした」と表示されること
