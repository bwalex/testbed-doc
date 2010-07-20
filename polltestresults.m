function polltestresults(test_id, test_data, xlsfile, xls_startfield)
    %n_nodes = 7;
    n_nodes = test_data(1, 2)
    test_results = [];

    for node=0:n_nodes-1
        [node_rtt, node_s2dt, node_retries, node_fails, avg_rtt, avg_s2dt, node_oobs, node_timeouts, node_seqid] = polldata_eval(node, test_data);
        % TEST_RUN NODE_ID RECVD_PKTS RETRIES FAILURES AVERAGE_RTT AVERAGE_S2DT VARIANCE_S2DT OOBS TIMEOUTS
        row = [test_id node node_seqid node_retries node_fails avg_rtt avg_s2dt var(node_s2dt)  node_oobs node_timeouts];
        test_results = vertcat(test_results, row);
    end

    d = { 'Test run #', 'Node id', 'Received packets', 'Retries', 'Fails', 'Average RTT', 'Average Delay', 'Delay variance', 'OOBs', 'Timeouts' };
    xlswrite(xlsfile, d, 'Test data', 'A2');
    xlswrite(xlsfile, test_results, 'Test data', xls_startfield);
end