Warbler::Config.new do |config|
  config.features = %w(executable compiled gemjar)

  config.dirs = %w(app config lib log bin)

  config.includes = FileList["Rakefile", "config.ru"]
  config.excludes = FileList[]

  config.webinf_files = FileList[]

  config.jar_name = "furniture"
end