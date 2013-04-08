module SimonAsks
  class QuestionUploader < SimonAsks::BaseSimonsUploader
    version :large do
      process resize_to_fill: [230, 170]
    end

    version :main do
      process resize_to_fill: [190, 135]
    end

    version :list do
      process resize_to_fill: [110, 80]
    end

    version :icon do
      process resize_to_fill: [70, 45]
    end
  end
end