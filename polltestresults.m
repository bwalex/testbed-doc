n_nodes = 7;
test_results = [];

for node=0:n_nodes-1
    [node_rtt, node_s2dt, node_retries, node_fails, avg_rtt, avg_s2dt, node_oobs, node_timeouts] = polldata_eval(node, poll_random_1);
    % TEST_RUN NODE_ID RETRIES FAILURES AVERAGE_RTT AVERAGE_S2DT VARIANCE_S2DT OOBS TIMEOUTS
    row = [1 node node_retries node_fails avg_rtt avg_s2dt var(node_s2dt)  node_oobs node_timeouts];
    test_results = vertcat(test_results, row);
end

for node=0:n_nodes-1
    [node_rtt, node_s2dt, node_retries, node_fails, avg_rtt, avg_s2dt, node_oobs, node_timeouts] = polldata_eval(node, poll_random_2);
    % TEST_RUN NODE_ID RETRIES FAILURES AVERAGE_RTT AVERAGE_S2DT VARIANCE_S2DT OOBS TIMEOUTS
    row = [2 node node_retries node_fails avg_rtt avg_s2dt var(node_s2dt)  node_oobs node_timeouts];
    test_results = vertcat(test_results, row);
end

d = { 'Test run #', 'Node id', 'Retries', 'Fails', 'Average RTT', 'Average Delay', 'Delay variance', 'OOBs', 'Timeouts' }
xlswrite('poll_random_1.xls', d, 'Test data', 'A2');
xlswrite('poll_random_1.xls', test_results, 'Test data', 'A3');