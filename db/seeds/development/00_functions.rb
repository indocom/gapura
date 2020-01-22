# frozen_string_literal: true

def get_mock_file_path(filename)
  Rails.root.join('app', 'assets', 'images', 'mock_datas', filename)
end

def get_image_mime_type(filename)
  "image/#{filename.split('.').last}"
end

def get_binary_data(filename)
  File.read(get_mock_file_path(filename))
end
