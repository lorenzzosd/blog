require 'spec_helper'

describe ProcessMarkdownWorker do
  it 'enqueues another process markdown worker' do
    ProcessMarkdownWorker.perform_async(1)

    expect(ProcessMarkdownWorker).to have_enqueued_sidekiq_job('ProcessMarkdownWorker', true)
  end
end