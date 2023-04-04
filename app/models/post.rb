class Post < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    has_rich_text :description
    serialize :fields, Array
    def fields=(fields)
      fields = fields.gsub(/\s+/, '')
      fields = fields.split(',') if fields.is_a?(String)
      super(fields)
    end
end
