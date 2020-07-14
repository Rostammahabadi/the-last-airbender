class AirbenderDecorator
  def initialize(nation)
    @nation = nation
    airbender_service
  end

  def airbender_service
    @airbender_service ||= AirbenderService.new
  end

  def list_of_members
    @airbender_service.nation_members(@nation)
  end
end
