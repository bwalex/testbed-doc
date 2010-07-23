%[node_s2dt, avg_s2dt, node_oobs, seq_id, node_recvdata] = polldata_eval(2, polldata_1)
function [node_s2dt, avg_s2dt, node_oobs, seq_id, node_recvdata, node_repeated] = csmadata_eval(node, polldata_1)
   node_s2dt = [];
   node_repeated = 0;
   node_recvdata = 0;
   node_oobs = 0;
   seq_id = 0;
   last_seq_id = -1;
   
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
           s2dt = polldata_1(x, 4);
           if node_id == node
                seq_id = polldata_1(x, 3);
                if (seq_id == last_seq_id)
                    node_repeated = node_repeated+1;
                end
                node_recvdata = node_recvdata+1;
                node_s2dt = horzcat(node_s2dt, s2dt);
                last_seq_id = seq_id;
           end
       end
    end
    avg_s2dt = mean(node_s2dt);
end