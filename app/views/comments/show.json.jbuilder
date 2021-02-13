#json.extract! @comment, :id, :user_id, :article_id, :body
json.id @comment.id
json.user_id @comment.user_id
json.article_id @comment.article_id
json.body @comment.body
json.user do
    json.email @comment.user.email
end