class AirbenderService
  def nation_members(nation)
    #nation = nation.split("_")
    params = { affiliation: "#{nation[0]}+#{nation[1]}"}
    get_json('api/v1/characters', params)
  end

  private

  def get_json(url, params)
    binding.pry
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://last-airbender-api.herokuapp.com') do |f|
      f.adapter Faraday.default_adapter
    end
  end

end
