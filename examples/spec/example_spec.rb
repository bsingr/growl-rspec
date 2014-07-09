describe 'Some examples' do
  it 'succeeds' do
    expect(true).to eq(true)
  end

  it 'pends' do
    pending 'a pending example'
  end

  it 'fails' do
    expect(false).to eq(true)
  end

  it 'fails too' do
    expect(false).to eq(true)
  end
end
