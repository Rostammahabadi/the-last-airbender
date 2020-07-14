class AirbenderService
  def nation_members(nation)
    nation = nation.split("_")
    params = { affiliation: "#{nation[0]}+#{nation[1]}"}
    get_json(/)
  end

  private

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'last-airbender-api.herokuapp.com/api/v1')

end
