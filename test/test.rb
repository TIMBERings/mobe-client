require_relative '../lib/mobe-client'
require 'webmock/rspec'

describe 'register_mock_response' do
  it 'has the proper format' do

    configurations = {}
    configurations['method'] = 'GET'
    configurations['path'] = '/teams/1096538'
    configurations['response'] = '{"result":{"id":1096538,"name":"Team Management","sport_id":1,"org_id":[11311],"short_name":"TeamMgmt","abbrev":"TM","primary_color":"222222","secondary_color":"666666","gender":null,"home_club":null,"home_city":null,"home_state":null,"home_country":null,"platform_team_id":null,"sport_name":"Ice Hockey","timezone":"US/Central","sport_stat_enabled":true,"crest":{"primary_color":"222222","secondary_color":"666666"},"permissions":{"read":true,"write":true},"metadata_attrs":{},"seasons":[{"permissions":{"read":true,"write":true},"id":226403,"name":"2016","league":{"league_id":null,"solo_team_league_id":135646,"name":"Solo"},"current":true,"subseasons":[{"id":247304,"name":"Regular Season","current":true}]}],"coach_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"player_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"team_variables":[]}}'
    configurations['statusCode'] = '200'


    url = "http://localhost:8000/mobe/response/register"

    stub_request(:post, url).
        with(:body => configurations.to_json,
             :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'}).
        to_return(:status => 200, :body => '', :headers => {})


    register_mock_response('localhost', 8000, configurations.to_json)


    expect(WebMock).to have_requested(:post, url).
                           with(:body => configurations.to_json).once

  end
end

describe 'unregister_mock_response' do
  it 'has the proper format' do

    configurations = {}
    configurations['method'] = 'GET'
    configurations['path'] = '/teams/1096538'
    configurations['response'] = '{"result":{"id":1096538,"name":"Team Management","sport_id":1,"org_id":[11311],"short_name":"TeamMgmt","abbrev":"TM","primary_color":"222222","secondary_color":"666666","gender":null,"home_club":null,"home_city":null,"home_state":null,"home_country":null,"platform_team_id":null,"sport_name":"Ice Hockey","timezone":"US/Central","sport_stat_enabled":true,"crest":{"primary_color":"222222","secondary_color":"666666"},"permissions":{"read":true,"write":true},"metadata_attrs":{},"seasons":[{"permissions":{"read":true,"write":true},"id":226403,"name":"2016","league":{"league_id":null,"solo_team_league_id":135646,"name":"Solo"},"current":true,"subseasons":[{"id":247304,"name":"Regular Season","current":true}]}],"coach_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"player_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"team_variables":[]}}'
    configurations['statusCode'] = '200'


    url = "http://localhost:8000/mobe/response/unregister"

    stub_request(:post, url).
        with(:body => configurations.to_json,
             :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'}).
        to_return(:status => 200, :body => '', :headers => {})


    unregister_mock_response('localhost', 8000, configurations.to_json)


    expect(WebMock).to have_requested(:post, url).
                           with(:body => configurations.to_json).once

  end
end
describe 'unregister_all_mock_responses' do
  it 'has the proper format' do
    url = "http://localhost:8000/mobe/response/unregister_all"

    stub_request(:post, url).
        with(:body => '',
             :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'}).
        to_return(:status => 200, :body => '', :headers => {})


    unregister_all_mock_responses('localhost', 8000)


    expect(WebMock).to have_requested(:post, url).
                           with(:body => '').once
  end
end

describe 'register_intercept' do
  it 'has the proper format' do

    configurations = {}
    configurations['method'] = 'POST'
    configurations['path'] = '/teams/1096538'
    configurations['response'] = '{"result":{"id":1096538,"name":"Team Management","sport_id":1,"org_id":[11311],"short_name":"TeamMgmt","abbrev":"TM","primary_color":"222222","secondary_color":"666666","gender":null,"home_club":null,"home_city":null,"home_state":null,"home_country":null,"platform_team_id":null,"sport_name":"Ice Hockey","timezone":"US/Central","sport_stat_enabled":true,"crest":{"primary_color":"222222","secondary_color":"666666"},"permissions":{"read":true,"write":true},"metadata_attrs":{},"seasons":[{"permissions":{"read":true,"write":true},"id":226403,"name":"2016","league":{"league_id":null,"solo_team_league_id":135646,"name":"Solo"},"current":true,"subseasons":[{"id":247304,"name":"Regular Season","current":true}]}],"coach_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"player_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"team_variables":[]}}'
    configurations['statusCode'] = '200'


    url = "http://localhost:8000/mobe/intercept/register"

    stub_request(:post, url).
        with(:body => configurations.to_json,
             :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'}).
        to_return(:status => 200, :body => '', :headers => {})


    register_intercept('localhost', 8000, configurations.to_json)


    expect(WebMock).to have_requested(:post, url).
                           with(:body => configurations.to_json).once

  end
end

describe 'unregister_intercept' do
  it 'has the proper format' do

    configurations = {}
    configurations['method'] = 'POST'
    configurations['path'] = '/teams/1096538'


    url = "http://localhost:8000/mobe/intercept/unregister"

    stub_request(:post, url).
        with(:body => configurations.to_json,
             :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'}).
        to_return(:status => 200, :body => '', :headers => {})


    unregister_intercept('localhost', 8000, configurations.to_json)


    expect(WebMock).to have_requested(:post, url).
                           with(:body => configurations.to_json).once

  end
end

describe 'unregister_all_intercepts' do
  it 'has the proper format' do
    url = "http://localhost:8000/mobe/intercept/unregister_all"

    stub_request(:post, url).
        with(:body => '',
             :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'}).
        to_return(:status => 200, :body => '', :headers => {})


    unregister_all_intercepts('localhost', 8000)


    expect(WebMock).to have_requested(:post, url).
                           with(:body => '').once
  end
end

describe 'get_intercept' do
  it 'has the proper format' do

    configurations = {}
    configurations['method'] = 'POST'
    configurations['path'] = '/teams/1096538'


    url = "http://localhost:8000/mobe/intercept/get"

    stub_request(:post, url).
        with(:body => configurations.to_json,
             :headers => {'Accept' => '*/*', 'Content-Type' => 'application/json', 'User-Agent' => 'Ruby'}).
        to_return(:status => 200, :body => '', :headers => {})


    get_intercept('localhost', 8000, configurations.to_json)


    expect(WebMock).to have_requested(:post, url).
                           with(:body => configurations.to_json).once

  end
end



# configurations = {}
# configurations['method'] = 'GET'
# configurations['path'] = '/teams/1096538'
# configurations['response'] = '{"result":{"id":1096538,"name":"Team Management","sport_id":1,"org_id":[11311],"short_name":"TeamMgmt","abbrev":"TM","primary_color":"222222","secondary_color":"666666","gender":null,"home_club":null,"home_city":null,"home_state":null,"home_country":null,"platform_team_id":null,"sport_name":"Ice Hockey","timezone":"US/Central","sport_stat_enabled":true,"crest":{"primary_color":"222222","secondary_color":"666666"},"permissions":{"read":true,"write":true},"metadata_attrs":{},"seasons":[{"permissions":{"read":true,"write":true},"id":226403,"name":"2016","league":{"league_id":null,"solo_team_league_id":135646,"name":"Solo"},"current":true,"subseasons":[{"id":247304,"name":"Regular Season","current":true}]}],"coach_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"player_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"team_variables":[]}}'
# configurations['statusCode'] = '200'
# register_mock_response('localhost', 8000, configurations.to_json)
#
# configurations = {}
# configurations['method'] = 'GET'
# configurations['path'] = '/teams/1096538'
# unregister_mock_response('localhost', 8000, configurations.to_json)
#
# configurations = {}
# configurations['method'] = 'PUT'
# configurations['path'] = '/players'
# configurations['response'] = '{ "result": { "id": 9714582, "first_name": "Added", "last_name": "Player", "jersey_number": null, "persona_id": 16088711, "positions": [], "status": "active", "effective_status": "active", "type": "player", "thumbnails": {}, "thumbnails_ssl": {}, "org_id": 11311, "metadata_attrs": {}, "roster_id": 1457166, "season_id": 226403, "invite_status": "uninvited", "invite_id": null, "title": null, "team_id": 1096538 } }'
# configurations['statusCode'] = '200'
# register_intercept('localhost', 8000, configurations.to_json)
#
# configurations = {}
# configurations['method'] = 'POST'
# configurations['path'] = '/players'
# configurations['response'] = '{ "result": { "id": 9714582, "first_name": "Added", "last_name": "Player", "jersey_number": null, "persona_id": 16088711, "positions": [], "status": "active", "effective_status": "active", "type": "player", "thumbnails": {}, "thumbnails_ssl": {}, "org_id": 11311, "metadata_attrs": {}, "roster_id": 1457166, "season_id": 226403, "invite_status": "uninvited", "invite_id": null, "title": null, "team_id": 1096538 } }'
# configurations['statusCode'] = '200'
# register_intercept('localhost', 8000, configurations.to_json)
#
# configurations = {}
# configurations['method'] = 'PUT'
# configurations['path'] = '/players'
# unregister_intercept('localhost', 8000, configurations.to_json)
#
# configurations = {}
# configurations['method'] = 'POST'
# configurations['path'] = '/players'
# unregister_intercept('localhost', 8000, configurations.to_json)
#
# configurations = {}
# configurations['method'] = 'GET'
# configurations['path'] = '/teams/109b6538'
# configurations['response'] = '{"result":{"id":1096538,"name":"Team Management","sport_id":1,"org_id":[11311],"short_name":"TeamMgmt","abbrev":"TM","primary_color":"222222","secondary_color":"666666","gender":null,"home_club":null,"home_city":null,"home_state":null,"home_country":null,"platform_team_id":null,"sport_name":"Ice Hockey","timezone":"US/Central","sport_stat_enabled":true,"crest":{"primary_color":"222222","secondary_color":"666666"},"permissions":{"read":true,"write":true},"metadata_attrs":{},"seasons":[{"permissions":{"read":true,"write":true},"id":226403,"name":"2016","league":{"league_id":null,"solo_team_league_id":135646,"name":"Solo"},"current":true,"subseasons":[{"id":247304,"name":"Regular Season","current":true}]}],"coach_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"player_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"team_variables":[]}}'
# configurations['statusCode'] = '200'
# register_mock_response('localhost', 8000, configurations.to_json)
#
# configurations = {}
# configurations['method'] = 'GET'
# configurations['path'] = '/teams/109a6538'
# configurations['response'] = '{"result":{"id":1096538,"name":"Team Management","sport_id":1,"org_id":[11311],"short_name":"TeamMgmt","abbrev":"TM","primary_color":"222222","secondary_color":"666666","gender":null,"home_club":null,"home_city":null,"home_state":null,"home_country":null,"platform_team_id":null,"sport_name":"Ice Hockey","timezone":"US/Central","sport_stat_enabled":true,"crest":{"primary_color":"222222","secondary_color":"666666"},"permissions":{"read":true,"write":true},"metadata_attrs":{},"seasons":[{"permissions":{"read":true,"write":true},"id":226403,"name":"2016","league":{"league_id":null,"solo_team_league_id":135646,"name":"Solo"},"current":true,"subseasons":[{"id":247304,"name":"Regular Season","current":true}]}],"coach_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"player_variables":[{"name":"Date of Birth","description":null},{"name":"Gender","description":null}],"team_variables":[]}}'
# configurations['statusCode'] = '200'
# register_mock_response('localhost', 8000, configurations.to_json)
#
# unregister_all_mock_responses('localhost', 8000)
#
# configurations = {}
# configurations['method'] = 'PUT'
# configurations['path'] = '/players'
# configurations['response'] = '{ "result": { "id": 9714582, "first_name": "Added", "last_name": "Player", "jersey_number": null, "persona_id": 16088711, "positions": [], "status": "active", "effective_status": "active", "type": "player", "thumbnails": {}, "thumbnails_ssl": {}, "org_id": 11311, "metadata_attrs": {}, "roster_id": 1457166, "season_id": 226403, "invite_status": "uninvited", "invite_id": null, "title": null, "team_id": 1096538 } }'
# configurations['statusCode'] = '200'
# register_intercept('localhost', 8000, configurations.to_json)
#
# configurations = {}
# configurations['method'] = 'POST'
# configurations['path'] = '/players'
# configurations['response'] = '{ "result": { "id": 9714582, "first_name": "Added", "last_name": "Player", "jersey_number": null, "persona_id": 16088711, "positions": [], "status": "active", "effective_status": "active", "type": "player", "thumbnails": {}, "thumbnails_ssl": {}, "org_id": 11311, "metadata_attrs": {}, "roster_id": 1457166, "season_id": 226403, "invite_status": "uninvited", "invite_id": null, "title": null, "team_id": 1096538 } }'
# configurations['statusCode'] = '200'
# register_intercept('localhost', 8000, configurations.to_json)
#
# unregister_all_intercepts('localhost', 8000)
# sleep(2)
