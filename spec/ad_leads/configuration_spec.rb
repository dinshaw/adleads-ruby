describe 'configuration' do

  let(:keys) { AdLeads::Configuration::VALID_CONFIG_KEYS }
  let(:key) { keys.sample }

  after { AdLeads.reset }

  it 'sets config keys' do
    AdLeads.configure do |config|
      config.public_send("#{key}=", key)
      expect(AdLeads.public_send(key)).to eq key
    end
  end

  it 'returns default values' do
    keys.each do |key|
      expect(AdLeads.send(key)).to eq AdLeads::Configuration.
        const_get("DEFAULT_#{key.upcase}")
    end
  end

  describe '#client_id' do
    it 'should return default key' do
      expect(AdLeads.client_id).to eq AdLeads::Configuration::DEFAULT_CLIENT_ID
    end
  end

  describe '#principle' do
    it 'should return default key' do
      expect(AdLeads.principle).to eq AdLeads::Configuration::DEFAULT_PRINCIPLE
    end
  end

  describe '#format' do
    it 'should return default format' do
      expect(AdLeads.format).to eq AdLeads::Configuration::DEFAULT_FORMAT
    end
  end

  describe '#user_agent' do
    it 'should return default user agent' do
      expect(AdLeads.user_agent).to eq AdLeads::Configuration::DEFAULT_USER_AGENT
    end
  end

end
