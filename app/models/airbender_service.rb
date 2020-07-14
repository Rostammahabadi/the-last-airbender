class AirbenderService
  def nation_members(nation)
    nation = nation.split("_").join(" ")
    params = { affiliation: "#{nation}"}
    get_json('/api/v1/characters', params)
  end

  private

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://last-airbender-api.herokuapp.com')
  end

end
