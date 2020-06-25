# Task-list

Source：https://github.com/EnEnLiu/5xtraining/blob/master/backend.md

## table

https://editor.ponyorm.com/user/entzu/task_list/designer

![Imgur](https://imgur.com/HvahIOW.jpg)
```
user 
has_many :task

task 
belongs_to :user
has_many :tag, through: :task_tag

tag
has_many :task, through: :task_tag

task_tag
belongs_to :task
belongs_to. :tag

```
