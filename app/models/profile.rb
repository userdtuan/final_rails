class Profile < ApplicationRecord
    mount_uploader :banner, BannerUploader
end
