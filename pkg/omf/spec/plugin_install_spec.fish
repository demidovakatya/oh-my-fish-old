function describe_plugin_install
  function it_returns_success_if_a_plugin_is_installed
    omf 'omf-test-plugin-valid' >/dev/null
    assert 0 = $status
  end
end
