def get_mock_file(filename)
  File.open(Rails.root.join('app', 'assets', 'images', 'mock_datas', filename))
end
