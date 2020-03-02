## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null:false|
|first_name|string|null:false|
|first_name_kana|string|null:false|
|last_name|string|null:false|
|last_name_kana|string|null:false|
|email|string|null:false,unique|
|password|string|null:false|
|introduction|text||
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|user_icon|text||
|point_amount|integer||
|profit_amount|integer||


### Association
- has_many :items, dependent: :destroy
- has_many :orders, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :street_address, dependent: :destroy
- has_many :cards


## street_addressテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|first_name|string|null:false|
|first_name_kana|string|null:false|
|last_name|string|null:false|
|last_name_kana|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building|string||
|zip_code|integer|null:false|
|telephone|integer||
|prefecture|reference|foreign_key: true|
|user_id|reference|null:false,foreign_key:ture|


### Association
- has_many :items, dependent: :destroy
- has_many :orders, dependent: :destroy
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|user_id|reference|null:false,foreign_key:ture|
|name|string|null:false|
|price|integer|null:false|
|brand|string||
|description|text|null:false|
|delivery_charge_id|integer|null:false|
|condition_id|integer|null:false|
|prefecture_id|integer|null:false|
|delivery_dates_id|integer|null:false|
|soldout_or_exhibiting_id|integer|default: 1|
|category_id|reference|foreign_key:true|
|order_id|reference|foreign_key:true|


### Association
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true- has_many :messages, dependent: :destroy
- has_many :message_users,through::messages,source::user, dependent: :destroy
- has_many :like_users,through::likes,source::user, dependent: :destroy
- has_one :order
- belongs_to :user
- belongs_to :category


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|message|text||
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|


### Association
- belongs_to :item
- belongs_to :user


## imageテーブル
|Column|Type|Options|
|------|----|-------|
|id|bigint||
|image_url|string|null:false|
|item_id|reference|null:false,foreign_key:true|


### Association
- belongs_to :item


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|user_id|integer||
|item_id|integer||
|item.user_id|reference|null:false,foreign_key:ture|(seller)


### Association
- has_many :rate_counts, dependent: :destroy
- belongs_to :user
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|category|string|null:false|
|ancestry|string|null:false|


### Association
- has_many :items, dependent: :destroy


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|size_category_id|reference|foreign_key:ture|
|size|string|null:false|


### Association
- belongs_to :size_category
- has_many :items, dependent: :destroy


## size_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|size_category|string||


### Association
- has_many :sizes


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|name|string|unique|

### Association
- has_many :items, dependent: :destroy


## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|howCondition|string||

### Association
- has_many :items, dependent: :destroy


## delivery_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|whichCharge|string||

### Association
- has_many :items, dependent: :destroy


## delivery_datesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|date|string||


### Association
- has_many :items, dependent: :destroy


## order_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|order_status|string||


### Association
- has_many :items, dependent: :destroy
- has_many :messages, dependent: :destroy