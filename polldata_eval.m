%[node_rtt, node_s2dt, node_retries, node_fails, avg_rtt, avg_s2dt, node_oobs, node_timeouts] = polldata_eval(2, polldata_1)
function [node_rtt, node_s2dt, node_retries, node_fails, avg_rtt, avg_s2dt, node_oobs, node_timeouts] = polldata_eval(node, polldata_1)
   node_rtt = [];
   node_s2dt = [];
   node_retries = 0;
   node_fails = 0;
   node_oobs = 0;
   node_timeouts = 0;
    for x=1:length(polldata_1)
       type = polldata_1(x, 1);
       if type == 2
           node_id = polldata_1(x, 2);
           if node_id == node
               node_oobs = node_oobs + 1;
           end
       end
       if type == 3
           node_id = polldata_1(x, 2);
           seq_id = polldata_1(x, 3);
           rtt = polldata_1(x, 4);
           s2dt = polldata_1(x, 5);
           retries = polldata_1(x, 6);
           fails = polldata_1(x, 7);
           if node_id == node
                node_rtt = horzcat(node_rtt, rtt);
                node_s2dt = horzcat(node_s2dt, s2dt);
                node_retries = retries + node_retries;
                node_fails = fails;
           end
       end
       if type == 4
           node_id = polldata_1(x, 2);
           if node_id == node
               node_timeouts = node_timeouts + 1;
           end
       end
    end
    avg_rtt = mean(node_rtt);
    avg_s2dt = mean(node_s2dt);
end