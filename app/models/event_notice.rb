class EventNotice < ApplicationRecord
    mount_uploader :image, ImageUploader
    mount_uploader :document, DocumentUploader
end
