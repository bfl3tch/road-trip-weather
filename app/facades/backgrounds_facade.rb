class BackgroundsFacade
  def self.get_backgrounds(location)
    result = BackgroundsService.get_backgrounds(location)
    Backgrounds.new(result, location)
  end
end
