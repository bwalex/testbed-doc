function csmatestresults(test_id, test_data, xlsfile, xls_startfield)
    %n_nodes = 7;
    n_nodes = test_data(1, 2)
    test_results = [];

    for node=0:n_nodes-1
        [node_s2dt, avg_s2dt, node_oobs, node_seqid, node_recvdata node_repeated] = csmadata_eval(node, test_data);
        % TEST_RUN NODE_ID SENT_PKTS RCVD_PKTS AVERAGE_S2DT VARIANCE_S2DT OOBS
        row = [test_id node node_seqid node_recvdata avg_s2dt var(node_s2dt)  node_oobs node_repeated];
        test_results = vertcat(test_results, row);
    end

    d = { 'Test run #', 'Node id', 'Sent Packets', 'Received packets', 'Average Delay', 'Delay variance', 'OOBs', 'Repeated Data' };
    xlswrite(xlsfile, d, 'Test data', 'A2');
    xlswrite(xlsfile, test_results, 'Test data', xls_startfield);
end