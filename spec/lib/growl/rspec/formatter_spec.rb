describe Growl::RSpec::Formatter do
  it 'dumps failures' do
    expect(::Growl).to receive(:notify).with(
      "1. it foo\n\nbar",
      {:title=>"1 specs failed",
        :image=>kind_of(String)})
    example = double('example')
    example.stub('description') { 'foo' }
    example.stub('metadata') { {:execution_result => {:exception => 'bar'}} }
    examples_notification = double('examples_notification')
    examples_notification.stub('failed_examples') { [example] }
    subject.dump_failures examples_notification
  end

  it 'dumps summary' do
    expect(::Growl).to receive(:notify).with(
      "10 specs in total (1 pending). Consumed 5.5s", {
        :title=>"5 specs failed!",
        :image=>kind_of(String)})
    summary = double('summary')
    summary.stub('duration') { 5.5 }
    summary.stub('example_count') { 10 }
    summary.stub('pending_count') { 1 }
    summary.stub('failure_count') { 5 }
    subject.dump_summary summary
  end
end
