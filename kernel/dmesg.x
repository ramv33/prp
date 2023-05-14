[46842.187947] [PRP] Loading PRP
[46842.187953] [PRP] Debug enabled
[46845.673257] [PRP] prp_dev_setup done
[46845.673266] [PRP] newlink called
[46845.673267] [PRP] Slave 1 verified
[46845.673269] [PRP] Slave 2 verified
[46845.673270] [PRP] prp_dev_finalize
[46845.673546] [PRP] prp0: register
[46845.673549] [PRP] registered 'prp0' successfully
[46845.673551] [PRP] prp_add_ports: Adding the ports
[46845.673552] [PRP] prp_port_setup: slave='enp3s0'
[46845.673557] r8169 0000:03:00.0 enp3s0: entered promiscuous mode
[46845.673868] [PRP] prp_port_setup: prp_dev='prp0', res=0
[46845.673872] [PRP] prp_port_setup: slave='wlan0'
[46845.673875] ath10k_pci 0000:04:00.0 wlan0: entered promiscuous mode
[46845.673913] [PRP] prp_port_setup: prp_dev='prp0', res=0
[46845.673918] [PRP] [PRP] prp_dev_change_mtu to 1494
[46845.673945] [PRP] prp0: change mtu
[46845.709577] [PRP] prp_dev_open
[46845.709670] IPv6: ADDRCONF(NETDEV_CHANGE): prp0: link becomes ready
[46845.720943] [PRP] prp_dev_xmit by PID=26881
[46845.720949] [PRP] prp_send_skb
[46845.720949] [PRP] prp_prepare_skb
[46845.720950] [PRP] proto = 86dd
[46845.720951] [PRP] skb->data=0000000032c0a1f8 skb->len=90, skb->tail=00000000e47f9fef, skb->tail=92
[46845.720954] [PRP] skb->data=0000000032c0a1f8 skb->len=96, skb->tail=00000000ef0dd714, skb->tail=98
[46845.720955] [PRP] prp_set_lsdu_size: lsdu_size=82, skb->mac_len=14
[46845.720956] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=82
[46845.720956] [PRP] prp_add_rct done
[46845.720958] [PRP] sending over port a: enp3s0
[46845.720969] [PRP] sending over port b: wlan0
[46845.720972] prp0: failed to send over port b
[46845.770948] [PRP] prp_dev_xmit by PID=26881
[46845.770954] [PRP] prp_send_skb
[46845.770955] [PRP] prp_prepare_skb
[46845.770956] [PRP] proto = 86dd
[46845.770957] [PRP] skb->data=00000000427997fe skb->len=86, skb->tail=000000004e07f51e, skb->tail=88
[46845.770960] [PRP] skb->data=00000000427997fe skb->len=92, skb->tail=00000000c40c21a7, skb->tail=94
[46845.770962] [PRP] prp_set_lsdu_size: lsdu_size=78, skb->mac_len=14
[46845.770963] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=78
[46845.770964] [PRP] prp_add_rct done
[46845.770966] [PRP] sending over port a: enp3s0
[46845.770979] [PRP] sending over port b: wlan0
[46845.770983] prp0: failed to send over port b
[46845.820923] [PRP] prp_dev_xmit by PID=26881
[46845.820927] [PRP] prp_send_skb
[46845.820928] [PRP] prp_prepare_skb
[46845.820929] [PRP] proto = 86dd
[46845.820930] [PRP] skb->data=000000007e124cab skb->len=90, skb->tail=000000005fcdd1b4, skb->tail=92
[46845.820933] [PRP] skb->data=000000007e124cab skb->len=96, skb->tail=00000000d43b3acf, skb->tail=98
[46845.820935] [PRP] prp_set_lsdu_size: lsdu_size=82, skb->mac_len=14
[46845.820936] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=82
[46845.820936] [PRP] prp_add_rct done
[46845.820938] [PRP] sending over port a: enp3s0
[46845.820949] [PRP] sending over port b: wlan0
[46845.820951] prp0: failed to send over port b
[46846.007553] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.007573] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.007580] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.007593] [PRP] prp_net_if: netif_rx DROPPED
[46846.008378] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46846.008384] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.008388] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.008394] [PRP] prp_net_if: netif_rx DROPPED
[46846.730179] [PRP] prp_recv_frame: dev='enp3s0': PID=34175: eth_hdr->proto = 0x800
[46846.730186] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.730189] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.730194] [PRP] prp_net_if: netif_rx DROPPED
[46846.730195] [PRP] prp_recv_frame: dev='enp3s0': PID=34175: eth_hdr->proto = 0x800
[46846.730196] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.730197] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.730199] [PRP] prp_net_if: netif_rx DROPPED
[46846.731783] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.731785] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.731787] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.731791] [PRP] prp_net_if: netif_rx DROPPED
[46846.731792] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.731793] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.731794] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.731795] [PRP] prp_net_if: netif_rx DROPPED
[46846.733078] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.733079] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.733080] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.733081] [PRP] prp_net_if: netif_rx DROPPED
[46846.734481] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x800
[46846.734483] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.734484] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.734486] [PRP] prp_net_if: netif_rx DROPPED
[46846.747690] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.747695] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.747698] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.747702] [PRP] prp_net_if: netif_rx DROPPED
[46846.748105] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.748107] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.748108] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.748110] [PRP] prp_net_if: netif_rx DROPPED
[46846.749020] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.749021] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.749022] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.749024] [PRP] prp_net_if: netif_rx DROPPED
[46846.749367] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.749369] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.749370] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.749371] [PRP] prp_net_if: netif_rx DROPPED
[46846.750279] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.750280] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.750281] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.750282] [PRP] prp_net_if: netif_rx DROPPED
[46846.750387] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.750388] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.750389] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.750390] [PRP] prp_net_if: netif_rx DROPPED
[46846.787622] [PRP] prp_dev_xmit by PID=26881
[46846.787628] [PRP] prp_send_skb
[46846.787629] [PRP] prp_prepare_skb
[46846.787631] [PRP] proto = 86dd
[46846.787633] [PRP] skb->data=00000000deb8ebbe skb->len=90, skb->tail=00000000e1b5bf9d, skb->tail=92
[46846.787639] [PRP] skb->data=00000000deb8ebbe skb->len=96, skb->tail=0000000096b984e1, skb->tail=98
[46846.787643] [PRP] prp_set_lsdu_size: lsdu_size=82, skb->mac_len=14
[46846.787645] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=82
[46846.787647] [PRP] prp_add_rct done
[46846.787649] [PRP] sending over port a: enp3s0
[46846.787663] [PRP] sending over port b: wlan0
[46846.787668] prp0: failed to send over port b
[46846.787799] [PRP] prp_dev_xmit by PID=751
[46846.787802] [PRP] prp_send_skb
[46846.787803] [PRP] prp_prepare_skb
[46846.787803] [PRP] proto = 86dd
[46846.787804] [PRP] skb->data=00000000f6730f1c skb->len=70, skb->tail=00000000f764794f, skb->tail=80
[46846.787807] [PRP] skb->data=00000000f6730f1c skb->len=76, skb->tail=00000000000573fe, skb->tail=86
[46846.787809] [PRP] prp_set_lsdu_size: lsdu_size=62, skb->mac_len=14
[46846.787809] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=62
[46846.787810] [PRP] prp_add_rct done
[46846.787811] [PRP] sending over port a: enp3s0
[46846.787817] [PRP] sending over port b: wlan0
[46846.787819] prp0: failed to send over port b
[46846.947779] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.947791] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.947797] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.947805] [PRP] prp_net_if: netif_rx DROPPED
[46846.955437] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.955443] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.955447] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.955452] [PRP] prp_net_if: netif_rx DROPPED
[46846.956056] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.956063] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.956067] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.956072] [PRP] prp_net_if: netif_rx DROPPED
[46846.958062] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.958068] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.958072] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.958077] [PRP] prp_net_if: netif_rx DROPPED
[46846.963379] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.963385] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.963389] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.963393] [PRP] prp_net_if: netif_rx DROPPED
[46846.965105] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.965111] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.965116] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.965121] [PRP] prp_net_if: netif_rx DROPPED
[46846.965317] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.965323] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.965328] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.965332] [PRP] prp_net_if: netif_rx DROPPED
[46846.972290] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46846.972297] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46846.972301] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46846.972306] [PRP] prp_net_if: netif_rx DROPPED
[46847.172987] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.173009] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.173017] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.173028] [PRP] prp_net_if: netif_rx DROPPED
[46847.174436] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.174449] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.174455] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.174462] [PRP] prp_net_if: netif_rx DROPPED
[46847.178977] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.178990] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.178996] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.179003] [PRP] prp_net_if: netif_rx DROPPED
[46847.182119] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.182130] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.182136] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.182143] [PRP] prp_net_if: netif_rx DROPPED
[46847.204558] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.204579] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.204586] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.204647] [PRP] prp_net_if: netif_rx DROPPED
[46847.204834] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.204838] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.204843] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.204848] [PRP] prp_net_if: netif_rx DROPPED
[46847.205466] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.205478] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.205485] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.205492] [PRP] prp_net_if: netif_rx DROPPED
[46847.205496] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.205501] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.205506] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.205511] [PRP] prp_net_if: netif_rx DROPPED
[46847.612991] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.613013] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.613021] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.613031] [PRP] prp_net_if: netif_rx DROPPED
[46847.614648] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.614661] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.614667] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.614674] [PRP] prp_net_if: netif_rx DROPPED
[46847.618873] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.618897] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.618905] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.618916] [PRP] prp_net_if: netif_rx DROPPED
[46847.630919] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.630942] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.630949] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.630959] [PRP] prp_net_if: netif_rx DROPPED
[46847.641627] [PRP] prp_dev_xmit by PID=26881
[46847.641637] [PRP] prp_send_skb
[46847.641638] [PRP] prp_prepare_skb
[46847.641640] [PRP] proto = 86dd
[46847.641642] [PRP] skb->data=000000002b92883a skb->len=90, skb->tail=00000000c5ebe695, skb->tail=92
[46847.641647] [PRP] skb->data=000000002b92883a skb->len=96, skb->tail=000000007d8b64f6, skb->tail=98
[46847.641651] [PRP] prp_set_lsdu_size: lsdu_size=82, skb->mac_len=14
[46847.641653] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=82
[46847.641654] [PRP] prp_add_rct done
[46847.641656] [PRP] sending over port a: enp3s0
[46847.641669] [PRP] sending over port b: wlan0
[46847.641675] prp0: failed to send over port b
[46847.657225] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.657235] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.657240] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.657298] [PRP] prp_net_if: netif_rx DROPPED
[46847.657781] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.657787] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.657792] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.657799] [PRP] prp_net_if: netif_rx DROPPED
[46847.658635] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.658647] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.658654] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.658661] [PRP] prp_net_if: netif_rx DROPPED
[46847.659332] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.659344] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.659350] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.659357] [PRP] prp_net_if: netif_rx DROPPED
[46847.684650] [PRP] prp_dev_xmit by PID=34179
[46847.684660] [PRP] prp_send_skb
[46847.684662] [PRP] prp_prepare_skb
[46847.684664] [PRP] proto = 800
[46847.684666] [PRP] skb->data=000000000497fa15 skb->len=342, skb->tail=0000000022eaa65d, skb->tail=344
[46847.684672] [PRP] skb->data=000000000497fa15 skb->len=348, skb->tail=000000001b0d4765, skb->tail=350
[46847.684676] [PRP] prp_set_lsdu_size: lsdu_size=334, skb->mac_len=14
[46847.684678] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=334
[46847.684680] [PRP] prp_add_rct done
[46847.684681] [PRP] sending over port a: enp3s0
[46847.684700] [PRP] sending over port b: wlan0
[46847.684705] prp0: failed to send over port b
[46847.685963] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.685982] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.685988] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.686001] [PRP] prp_net_if: netif_rx DROPPED
[46847.686278] [PRP] prp_dev_xmit by PID=34178
[46847.686281] [PRP] prp_send_skb
[46847.686282] [PRP] prp_prepare_skb
[46847.686283] [PRP] proto = 806
[46847.686284] [PRP] skb->data=0000000036d98fa8 skb->len=42, skb->tail=000000006353f5ca, skb->tail=44
[46847.686287] [PRP] skb->data=0000000036d98fa8 skb->len=48, skb->tail=000000001ab50d4e, skb->tail=50
[46847.686288] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46847.686290] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46847.686291] [PRP] prp_add_rct done
[46847.686292] [PRP] sending over port a: enp3s0
[46847.686297] [PRP] sending over port b: wlan0
[46847.686299] prp0: failed to send over port b
[46847.807344] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.807356] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.807361] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.807421] [PRP] prp_net_if: netif_rx DROPPED
[46847.812227] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.812240] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.812246] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.812260] [PRP] prp_net_if: netif_rx DROPPED
[46847.812262] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46847.812265] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.812268] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.812273] [PRP] prp_net_if: netif_rx DROPPED
[46847.822800] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.822814] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.822820] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.822838] [PRP] prp_net_if: netif_rx DROPPED
[46847.822840] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.822843] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.822846] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.822849] [PRP] prp_net_if: netif_rx DROPPED
[46847.823556] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.823563] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.823567] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.823573] [PRP] prp_net_if: netif_rx DROPPED
[46847.823769] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46847.823772] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46847.823775] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46847.823778] [PRP] prp_net_if: netif_rx DROPPED
[46848.510961] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46848.510984] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46848.510991] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46848.511002] [PRP] prp_net_if: netif_rx DROPPED
[46848.516994] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46848.517004] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46848.517019] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46848.517030] [PRP] prp_net_if: netif_rx DROPPED
[46848.530957] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46848.530966] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46848.530971] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46848.530980] [PRP] prp_net_if: netif_rx DROPPED
[46848.563494] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46848.563518] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46848.563526] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46848.563587] [PRP] prp_net_if: netif_rx DROPPED
[46848.563993] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46848.563997] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46848.564000] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46848.564005] [PRP] prp_net_if: netif_rx DROPPED
[46848.565257] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46848.565264] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46848.565268] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46848.565274] [PRP] prp_net_if: netif_rx DROPPED
[46848.566473] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46848.566480] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46848.566484] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46848.566490] [PRP] prp_net_if: netif_rx DROPPED
[46848.582576] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46848.582587] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46848.582592] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46848.582608] [PRP] prp_net_if: netif_rx DROPPED
[46849.675363] [PRP] prp_dev_xmit by PID=34178
[46849.675374] [PRP] prp_send_skb
[46849.675376] [PRP] prp_prepare_skb
[46849.675378] [PRP] proto = 806
[46849.675380] [PRP] skb->data=0000000004d2c619 skb->len=42, skb->tail=0000000029985f71, skb->tail=44
[46849.675385] [PRP] skb->data=0000000004d2c619 skb->len=48, skb->tail=00000000f0a56d96, skb->tail=50
[46849.675389] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46849.675391] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46849.675393] [PRP] prp_add_rct done
[46849.675394] [PRP] sending over port a: enp3s0
[46849.675411] [PRP] sending over port b: wlan0
[46849.675416] prp0: failed to send over port b
[46850.302524] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46850.302549] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46850.302557] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46850.302571] [PRP] prp_net_if: netif_rx DROPPED
[46850.309159] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46850.309165] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46850.309170] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46850.309176] [PRP] prp_net_if: netif_rx DROPPED
[46850.322902] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46850.322914] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46850.322920] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46850.322934] [PRP] prp_net_if: netif_rx DROPPED
[46850.374744] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46850.374770] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46850.374779] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46850.374793] [PRP] prp_net_if: netif_rx DROPPED
[46850.484884] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46850.484915] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46850.484923] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46850.484937] [PRP] prp_net_if: netif_rx DROPPED
[46850.484941] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46850.484946] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46850.484950] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46850.484955] [PRP] prp_net_if: netif_rx DROPPED
[46850.485371] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x800
[46850.485375] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46850.485379] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46850.485382] [PRP] prp_net_if: netif_rx DROPPED
[46850.485918] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46850.485921] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46850.485924] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46850.485928] [PRP] prp_net_if: netif_rx DROPPED
[46850.789572] [PRP] prp_dev_xmit by PID=751
[46850.789581] [PRP] prp_send_skb
[46850.789583] [PRP] prp_prepare_skb
[46850.789584] [PRP] proto = 86dd
[46850.789586] [PRP] skb->data=0000000048b4ca11 skb->len=70, skb->tail=00000000d28b92b6, skb->tail=80
[46850.789593] [PRP] skb->data=0000000048b4ca11 skb->len=76, skb->tail=0000000052062d22, skb->tail=86
[46850.789596] [PRP] prp_set_lsdu_size: lsdu_size=62, skb->mac_len=14
[46850.789598] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=62
[46850.789600] [PRP] prp_add_rct done
[46850.789601] [PRP] sending over port a: enp3s0
[46850.789617] [PRP] sending over port b: wlan0
[46850.789622] prp0: failed to send over port b
[46851.061587] [PRP] prp_dev_xmit by PID=34178
[46851.061598] [PRP] prp_send_skb
[46851.061600] [PRP] prp_prepare_skb
[46851.061601] [PRP] proto = 806
[46851.061603] [PRP] skb->data=00000000beafc75e skb->len=42, skb->tail=000000006e5be79d, skb->tail=44
[46851.061609] [PRP] skb->data=00000000beafc75e skb->len=48, skb->tail=0000000035d856fd, skb->tail=50
[46851.061612] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46851.061614] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46851.061616] [PRP] prp_add_rct done
[46851.061617] [PRP] sending over port a: enp3s0
[46851.061632] [PRP] sending over port b: wlan0
[46851.061637] prp0: failed to send over port b
[46851.737605] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46851.737635] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46851.737642] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46851.737656] [PRP] prp_net_if: netif_rx DROPPED
[46851.770370] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46851.770401] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46851.770409] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46851.770424] [PRP] prp_net_if: netif_rx DROPPED
[46851.770428] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46851.770433] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46851.770437] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46851.770443] [PRP] prp_net_if: netif_rx DROPPED
[46851.771014] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46851.771019] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46851.771022] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46851.771027] [PRP] prp_net_if: netif_rx DROPPED
[46851.772009] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46851.772016] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46851.772021] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46851.772027] [PRP] prp_net_if: netif_rx DROPPED
[46851.772578] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46851.772585] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46851.772589] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46851.772596] [PRP] prp_net_if: netif_rx DROPPED
[46851.772598] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46851.772601] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46851.772603] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46851.772607] [PRP] prp_net_if: netif_rx DROPPED
[46852.843037] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46852.843076] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46852.843084] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46852.843099] [PRP] prp_net_if: netif_rx DROPPED
[46852.847926] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46852.847936] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46852.847942] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46852.847954] [PRP] prp_net_if: netif_rx DROPPED
[46852.847981] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46852.847984] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46852.847987] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46852.847990] [PRP] prp_net_if: netif_rx DROPPED
[46852.861324] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46852.861335] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46852.861341] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46852.861406] [PRP] prp_net_if: netif_rx DROPPED
[46853.822953] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46853.822979] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46853.822987] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46853.822999] [PRP] prp_net_if: netif_rx DROPPED
[46853.827986] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46853.827997] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46853.828003] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46853.828059] [PRP] prp_net_if: netif_rx DROPPED
[46853.844003] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46853.844014] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46853.844020] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46853.844031] [PRP] prp_net_if: netif_rx DROPPED
[46853.959085] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46853.959119] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46853.959128] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46853.959142] [PRP] prp_net_if: netif_rx DROPPED
[46854.110602] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46854.110634] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46854.110641] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46854.110654] [PRP] prp_net_if: netif_rx DROPPED
[46854.110866] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x800
[46854.110870] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46854.110873] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46854.110877] [PRP] prp_net_if: netif_rx DROPPED
[46854.113349] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46854.113356] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46854.113360] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46854.113365] [PRP] prp_net_if: netif_rx DROPPED
[46854.113393] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46854.113396] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46854.113399] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46854.113402] [PRP] prp_net_if: netif_rx DROPPED
[46854.736966] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46854.736988] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46854.736996] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46854.737005] [PRP] prp_net_if: netif_rx DROPPED
[46854.739717] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46854.739728] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46854.739734] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46854.739745] [PRP] prp_net_if: netif_rx DROPPED
[46854.791757] [PRP] prp_dev_xmit by PID=751
[46854.791767] [PRP] prp_send_skb
[46854.791768] [PRP] prp_prepare_skb
[46854.791770] [PRP] proto = 86dd
[46854.791772] [PRP] skb->data=00000000e8a55a2c skb->len=70, skb->tail=00000000c30b9ac8, skb->tail=80
[46854.791777] [PRP] skb->data=00000000e8a55a2c skb->len=76, skb->tail=000000002c143d12, skb->tail=86
[46854.791780] [PRP] prp_set_lsdu_size: lsdu_size=62, skb->mac_len=14
[46854.791782] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=62
[46854.791784] [PRP] prp_add_rct done
[46854.791785] [PRP] sending over port a: enp3s0
[46854.791803] [PRP] sending over port b: wlan0
[46854.791808] prp0: failed to send over port b
[46856.751966] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46856.752005] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46856.752013] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46856.752027] [PRP] prp_net_if: netif_rx DROPPED
[46856.752031] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46856.752036] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46856.752041] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46856.752046] [PRP] prp_net_if: netif_rx DROPPED
[46856.755631] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46856.755638] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46856.755643] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46856.755648] [PRP] prp_net_if: netif_rx DROPPED
[46856.755651] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46856.755653] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46856.755656] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46856.755659] [PRP] prp_net_if: netif_rx DROPPED
[46856.756979] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46856.756986] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46856.756991] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46856.756996] [PRP] prp_net_if: netif_rx DROPPED
[46856.756998] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46856.757001] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46856.757004] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46856.757007] [PRP] prp_net_if: netif_rx DROPPED
[46857.828113] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46857.828142] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46857.828153] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46857.828169] [PRP] prp_net_if: netif_rx DROPPED
[46857.830915] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46857.830922] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46857.830926] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46857.830932] [PRP] prp_net_if: netif_rx DROPPED
[46857.830934] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46857.830937] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46857.830940] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46857.830943] [PRP] prp_net_if: netif_rx DROPPED
[46857.831423] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46857.831430] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46857.831434] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46857.831440] [PRP] prp_net_if: netif_rx DROPPED
[46858.794299] [PRP] prp_dev_xmit by PID=751
[46858.794309] [PRP] prp_send_skb
[46858.794310] [PRP] prp_prepare_skb
[46858.794312] [PRP] proto = 86dd
[46858.794314] [PRP] skb->data=0000000045cdb13a skb->len=70, skb->tail=000000002ffffd51, skb->tail=80
[46858.794320] [PRP] skb->data=0000000045cdb13a skb->len=76, skb->tail=00000000a25c995f, skb->tail=86
[46858.794323] [PRP] prp_set_lsdu_size: lsdu_size=62, skb->mac_len=14
[46858.794325] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=62
[46858.794327] [PRP] prp_add_rct done
[46858.794329] [PRP] sending over port a: enp3s0
[46858.794346] [PRP] sending over port b: wlan0
[46858.794351] prp0: failed to send over port b
[46859.352504] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46859.352535] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46859.352542] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46859.352555] [PRP] prp_net_if: netif_rx DROPPED
[46859.359907] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46859.359917] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46859.359923] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46859.359981] [PRP] prp_net_if: netif_rx DROPPED
[46860.799707] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46860.799744] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46860.799752] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46860.799765] [PRP] prp_net_if: netif_rx DROPPED
[46861.188302] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.188325] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.188333] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.188396] [PRP] prp_net_if: netif_rx DROPPED
[46861.255000] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.255034] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.255043] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.255056] [PRP] prp_net_if: netif_rx DROPPED
[46861.267829] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.267840] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.267846] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.267856] [PRP] prp_net_if: netif_rx DROPPED
[46861.367118] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.367150] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.367158] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.367169] [PRP] prp_net_if: netif_rx DROPPED
[46861.367997] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.368002] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.368006] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.368010] [PRP] prp_net_if: netif_rx DROPPED
[46861.368649] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.368656] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.368660] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.368666] [PRP] prp_net_if: netif_rx DROPPED
[46861.368866] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.368869] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.368872] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.368876] [PRP] prp_net_if: netif_rx DROPPED
[46861.773743] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.773768] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.773777] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.773792] [PRP] prp_net_if: netif_rx DROPPED
[46861.773796] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.773800] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.773805] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.773809] [PRP] prp_net_if: netif_rx DROPPED
[46861.776104] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.776111] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.776115] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.776121] [PRP] prp_net_if: netif_rx DROPPED
[46861.776123] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.776126] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.776128] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.776131] [PRP] prp_net_if: netif_rx DROPPED
[46861.780002] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.780011] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.780018] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.780027] [PRP] prp_net_if: netif_rx DROPPED
[46861.780054] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46861.780057] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46861.780060] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46861.780063] [PRP] prp_net_if: netif_rx DROPPED
[46862.852514] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46862.852551] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46862.852560] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46862.852573] [PRP] prp_net_if: netif_rx DROPPED
[46862.854528] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46862.854533] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46862.854536] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46862.854540] [PRP] prp_net_if: netif_rx DROPPED
[46862.854567] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46862.854569] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46862.854572] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46862.854574] [PRP] prp_net_if: netif_rx DROPPED
[46862.855260] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46862.855266] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46862.855271] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46862.855277] [PRP] prp_net_if: netif_rx DROPPED
[46863.318995] [PRP] prp_dev_xmit by PID=34198
[46863.319003] [PRP] prp_send_skb
[46863.319005] [PRP] prp_prepare_skb
[46863.319006] [PRP] proto = 806
[46863.319008] [PRP] skb->data=000000003397dae0 skb->len=42, skb->tail=000000004ad4d7a0, skb->tail=44
[46863.319014] [PRP] skb->data=000000003397dae0 skb->len=48, skb->tail=000000003c5c1f81, skb->tail=50
[46863.319018] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46863.319020] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46863.319021] [PRP] prp_add_rct done
[46863.319023] [PRP] sending over port a: enp3s0
[46863.319036] [PRP] sending over port b: wlan0
[46863.319041] prp0: failed to send over port b
[46863.319570] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46863.319578] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46863.319583] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46863.319589] [PRP] prp_net_if: netif_rx DROPPED
[46864.334685] [PRP] prp_dev_xmit by PID=0
[46864.334705] [PRP] prp_send_skb
[46864.334709] [PRP] prp_prepare_skb
[46864.334712] [PRP] proto = 806
[46864.334717] [PRP] skb->data=00000000af1f8d23 skb->len=42, skb->tail=000000000487fed1, skb->tail=44
[46864.334725] [PRP] skb->data=00000000af1f8d23 skb->len=48, skb->tail=00000000971a15e7, skb->tail=50
[46864.334731] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46864.334735] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46864.334738] [PRP] prp_add_rct done
[46864.334742] [PRP] sending over port a: enp3s0
[46864.334763] [PRP] sending over port b: wlan0
[46864.334772] prp0: failed to send over port b
[46864.335296] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46864.335304] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46864.335308] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46864.335315] [PRP] prp_net_if: netif_rx DROPPED
[46865.348008] [PRP] prp_dev_xmit by PID=0
[46865.348027] [PRP] prp_send_skb
[46865.348030] [PRP] prp_prepare_skb
[46865.348033] [PRP] proto = 806
[46865.348037] [PRP] skb->data=00000000f35eb762 skb->len=42, skb->tail=00000000782ca57f, skb->tail=44
[46865.348044] [PRP] skb->data=00000000f35eb762 skb->len=48, skb->tail=0000000041a3fd7d, skb->tail=50
[46865.348049] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46865.348053] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46865.348057] [PRP] prp_add_rct done
[46865.348060] [PRP] sending over port a: enp3s0
[46865.348080] [PRP] sending over port b: wlan0
[46865.348086] prp0: failed to send over port b
[46865.348606] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46865.348615] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46865.348621] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46865.348629] [PRP] prp_net_if: netif_rx DROPPED
[46866.361516] [PRP] prp_dev_xmit by PID=34198
[46866.361525] [PRP] prp_send_skb
[46866.361527] [PRP] prp_prepare_skb
[46866.361528] [PRP] proto = 806
[46866.361530] [PRP] skb->data=00000000e0e2011c skb->len=42, skb->tail=0000000091573205, skb->tail=44
[46866.361536] [PRP] skb->data=00000000e0e2011c skb->len=48, skb->tail=00000000dcbcf3b1, skb->tail=50
[46866.361540] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46866.361542] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46866.361543] [PRP] prp_add_rct done
[46866.361545] [PRP] sending over port a: enp3s0
[46866.361562] [PRP] sending over port b: wlan0
[46866.361567] prp0: failed to send over port b
[46866.362084] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46866.362098] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46866.362104] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46866.362113] [PRP] prp_net_if: netif_rx DROPPED
[46866.758531] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46866.758554] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46866.758564] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46866.758576] [PRP] prp_net_if: netif_rx DROPPED
[46866.758580] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46866.758586] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46866.758591] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46866.758596] [PRP] prp_net_if: netif_rx DROPPED
[46866.762970] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46866.762987] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46866.762995] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46866.763005] [PRP] prp_net_if: netif_rx DROPPED
[46866.768055] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46866.768068] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46866.768075] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46866.768082] [PRP] prp_net_if: netif_rx DROPPED
[46866.789696] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46866.789722] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46866.789730] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46866.789743] [PRP] prp_net_if: netif_rx DROPPED
[46866.789747] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46866.789753] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46866.789758] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46866.789763] [PRP] prp_net_if: netif_rx DROPPED
[46867.374273] [PRP] prp_dev_xmit by PID=0
[46867.374293] [PRP] prp_send_skb
[46867.374296] [PRP] prp_prepare_skb
[46867.374299] [PRP] proto = 806
[46867.374303] [PRP] skb->data=000000004b1727b0 skb->len=42, skb->tail=00000000cea2f4c3, skb->tail=44
[46867.374310] [PRP] skb->data=000000004b1727b0 skb->len=48, skb->tail=00000000bfaaad73, skb->tail=50
[46867.374316] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46867.374319] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46867.374323] [PRP] prp_add_rct done
[46867.374326] [PRP] sending over port a: enp3s0
[46867.374347] [PRP] sending over port b: wlan0
[46867.374353] prp0: failed to send over port b
[46867.374877] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46867.374887] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46867.374893] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46867.374901] [PRP] prp_net_if: netif_rx DROPPED
[46867.838487] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46867.838506] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46867.838513] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46867.838525] [PRP] prp_net_if: netif_rx DROPPED
[46867.839101] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46867.839113] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46867.839120] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46867.839127] [PRP] prp_net_if: netif_rx DROPPED
[46867.842190] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46867.842202] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46867.842208] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46867.842215] [PRP] prp_net_if: netif_rx DROPPED
[46867.842219] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46867.842224] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46867.842229] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46867.842234] [PRP] prp_net_if: netif_rx DROPPED
[46868.387950] [PRP] prp_dev_xmit by PID=0
[46868.387973] [PRP] prp_send_skb
[46868.387979] [PRP] prp_prepare_skb
[46868.387984] [PRP] proto = 806
[46868.387991] [PRP] skb->data=00000000f0b415b1 skb->len=42, skb->tail=00000000ecff96ed, skb->tail=44
[46868.388002] [PRP] skb->data=00000000f0b415b1 skb->len=48, skb->tail=00000000e0ca4895, skb->tail=50
[46868.388009] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46868.388014] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46868.388018] [PRP] prp_add_rct done
[46868.388023] [PRP] sending over port a: enp3s0
[46868.388041] [PRP] sending over port b: wlan0
[46868.388047] prp0: failed to send over port b
[46868.388556] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46868.388566] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46868.388571] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46868.388579] [PRP] prp_net_if: netif_rx DROPPED
[46869.401525] [PRP] prp_dev_xmit by PID=34198
[46869.401536] [PRP] prp_send_skb
[46869.401538] [PRP] prp_prepare_skb
[46869.401539] [PRP] proto = 806
[46869.401541] [PRP] skb->data=000000005c050d79 skb->len=42, skb->tail=00000000bdd6a393, skb->tail=44
[46869.401547] [PRP] skb->data=000000005c050d79 skb->len=48, skb->tail=000000001e8ab0bc, skb->tail=50
[46869.401550] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46869.401552] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46869.401554] [PRP] prp_add_rct done
[46869.401556] [PRP] sending over port a: enp3s0
[46869.401575] [PRP] sending over port b: wlan0
[46869.401581] prp0: failed to send over port b
[46869.402106] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46869.402120] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46869.402127] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46869.402135] [PRP] prp_net_if: netif_rx DROPPED
[46870.414682] [PRP] prp_dev_xmit by PID=0
[46870.414704] [PRP] prp_send_skb
[46870.414708] [PRP] prp_prepare_skb
[46870.414711] [PRP] proto = 806
[46870.414715] [PRP] skb->data=00000000a7719a55 skb->len=42, skb->tail=00000000acd19770, skb->tail=44
[46870.414723] [PRP] skb->data=00000000a7719a55 skb->len=48, skb->tail=0000000055d8b3fc, skb->tail=50
[46870.414729] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46870.414733] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46870.414737] [PRP] prp_add_rct done
[46870.414740] [PRP] sending over port a: enp3s0
[46870.414764] [PRP] sending over port b: wlan0
[46870.414771] prp0: failed to send over port b
[46870.415295] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46870.415306] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46870.415313] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46870.415323] [PRP] prp_net_if: netif_rx DROPPED
[46871.428061] [PRP] prp_dev_xmit by PID=0
[46871.428079] [PRP] prp_send_skb
[46871.428083] [PRP] prp_prepare_skb
[46871.428087] [PRP] proto = 806
[46871.428091] [PRP] skb->data=00000000aa7ab31e skb->len=42, skb->tail=0000000027c27258, skb->tail=44
[46871.428099] [PRP] skb->data=00000000aa7ab31e skb->len=48, skb->tail=00000000ee49ef24, skb->tail=50
[46871.428104] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46871.428108] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46871.428112] [PRP] prp_add_rct done
[46871.428115] [PRP] sending over port a: enp3s0
[46871.428136] [PRP] sending over port b: wlan0
[46871.428143] prp0: failed to send over port b
[46871.428665] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46871.428676] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46871.428683] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46871.428692] [PRP] prp_net_if: netif_rx DROPPED
[46871.779788] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46871.779808] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46871.779817] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46871.779829] [PRP] prp_net_if: netif_rx DROPPED
[46871.779833] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46871.779838] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46871.779843] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46871.779849] [PRP] prp_net_if: netif_rx DROPPED
[46871.786589] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46871.786601] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46871.786607] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46871.786614] [PRP] prp_net_if: netif_rx DROPPED
[46871.786837] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46871.786842] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46871.786847] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46871.786852] [PRP] prp_net_if: netif_rx DROPPED
[46871.795768] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46871.795788] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46871.795797] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46871.795807] [PRP] prp_net_if: netif_rx DROPPED
[46871.795811] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46871.795816] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46871.795821] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46871.795826] [PRP] prp_net_if: netif_rx DROPPED
[46872.441739] [PRP] prp_dev_xmit by PID=34198
[46872.441753] [PRP] prp_send_skb
[46872.441754] [PRP] prp_prepare_skb
[46872.441755] [PRP] proto = 806
[46872.441757] [PRP] skb->data=00000000aeaabe5f skb->len=42, skb->tail=00000000c9c2f403, skb->tail=44
[46872.441763] [PRP] skb->data=00000000aeaabe5f skb->len=48, skb->tail=00000000c78a0143, skb->tail=50
[46872.441766] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46872.441768] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46872.441770] [PRP] prp_add_rct done
[46872.441771] [PRP] sending over port a: enp3s0
[46872.441788] [PRP] sending over port b: wlan0
[46872.441794] prp0: failed to send over port b
[46872.442306] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46872.442319] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46872.442325] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46872.442334] [PRP] prp_net_if: netif_rx DROPPED
[46872.862847] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46872.862869] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46872.862876] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46872.862889] [PRP] prp_net_if: netif_rx DROPPED
[46872.863406] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46872.863418] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46872.863425] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46872.863438] [PRP] prp_net_if: netif_rx DROPPED
[46872.867096] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46872.867119] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46872.867127] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46872.867186] [PRP] prp_net_if: netif_rx DROPPED
[46872.867191] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46872.867196] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46872.867200] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46872.867206] [PRP] prp_net_if: netif_rx DROPPED
[46873.454661] [PRP] prp_dev_xmit by PID=0
[46873.454678] [PRP] prp_send_skb
[46873.454681] [PRP] prp_prepare_skb
[46873.454685] [PRP] proto = 806
[46873.454688] [PRP] skb->data=000000003be1a7c2 skb->len=42, skb->tail=00000000062480cb, skb->tail=44
[46873.454696] [PRP] skb->data=000000003be1a7c2 skb->len=48, skb->tail=0000000098bfb434, skb->tail=50
[46873.454702] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46873.454705] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46873.454709] [PRP] prp_add_rct done
[46873.454712] [PRP] sending over port a: enp3s0
[46873.454730] [PRP] sending over port b: wlan0
[46873.454736] prp0: failed to send over port b
[46873.455252] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46873.455262] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46873.455267] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46873.455275] [PRP] prp_net_if: netif_rx DROPPED
[46874.467599] [PRP] prp_dev_xmit by PID=0
[46874.467616] [PRP] prp_send_skb
[46874.467619] [PRP] prp_prepare_skb
[46874.467623] [PRP] proto = 806
[46874.467626] [PRP] skb->data=000000000d17e82c skb->len=42, skb->tail=00000000f3b18110, skb->tail=44
[46874.467634] [PRP] skb->data=000000000d17e82c skb->len=48, skb->tail=000000007c350a40, skb->tail=50
[46874.467639] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46874.467643] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46874.467646] [PRP] prp_add_rct done
[46874.467649] [PRP] sending over port a: enp3s0
[46874.467670] [PRP] sending over port b: wlan0
[46874.467677] prp0: failed to send over port b
[46874.468187] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46874.468197] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46874.468203] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46874.468212] [PRP] prp_net_if: netif_rx DROPPED
[46875.135615] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46875.135634] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46875.135642] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46875.135653] [PRP] prp_net_if: netif_rx DROPPED
[46875.481049] [PRP] prp_dev_xmit by PID=34198
[46875.481059] [PRP] prp_send_skb
[46875.481061] [PRP] prp_prepare_skb
[46875.481062] [PRP] proto = 806
[46875.481064] [PRP] skb->data=0000000075ad8c4c skb->len=42, skb->tail=00000000c1ced3ae, skb->tail=44
[46875.481070] [PRP] skb->data=0000000075ad8c4c skb->len=48, skb->tail=000000001de37a17, skb->tail=50
[46875.481074] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46875.481076] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46875.481077] [PRP] prp_add_rct done
[46875.481079] [PRP] sending over port a: enp3s0
[46875.481094] [PRP] sending over port b: wlan0
[46875.481099] prp0: failed to send over port b
[46875.481609] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46875.481616] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46875.481621] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46875.481627] [PRP] prp_net_if: netif_rx DROPPED
[46875.524573] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46875.524586] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46875.524593] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46875.524656] [PRP] prp_net_if: netif_rx DROPPED
[46875.591098] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46875.591115] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46875.591123] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46875.591135] [PRP] prp_net_if: netif_rx DROPPED
[46875.603944] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46875.603967] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46875.603975] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46875.603986] [PRP] prp_net_if: netif_rx DROPPED
[46876.494639] [PRP] prp_dev_xmit by PID=0
[46876.494658] [PRP] prp_send_skb
[46876.494661] [PRP] prp_prepare_skb
[46876.494664] [PRP] proto = 806
[46876.494668] [PRP] skb->data=000000009fd52533 skb->len=42, skb->tail=00000000a0017f44, skb->tail=44
[46876.494675] [PRP] skb->data=000000009fd52533 skb->len=48, skb->tail=00000000ad3f0ac7, skb->tail=50
[46876.494681] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46876.494685] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46876.494688] [PRP] prp_add_rct done
[46876.494691] [PRP] sending over port a: enp3s0
[46876.494719] [PRP] sending over port b: wlan0
[46876.494726] prp0: failed to send over port b
[46876.495242] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x806
[46876.495248] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.495252] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.495258] [PRP] prp_net_if: netif_rx DROPPED
[46876.725942] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46876.725975] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.725983] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.725995] [PRP] prp_net_if: netif_rx DROPPED
[46876.726192] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x800
[46876.726196] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.726199] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.726203] [PRP] prp_net_if: netif_rx DROPPED
[46876.726473] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x800
[46876.726476] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.726479] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.726483] [PRP] prp_net_if: netif_rx DROPPED
[46876.727684] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46876.727689] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.727692] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.727696] [PRP] prp_net_if: netif_rx DROPPED
[46876.763841] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46876.763878] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.763886] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.763959] [PRP] prp_net_if: netif_rx DROPPED
[46876.763963] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46876.763968] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.763973] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.763980] [PRP] prp_net_if: netif_rx DROPPED
[46876.771859] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46876.771871] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.771877] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.771888] [PRP] prp_net_if: netif_rx DROPPED
[46876.772953] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46876.772960] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.772964] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.772970] [PRP] prp_net_if: netif_rx DROPPED
[46876.773650] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46876.773653] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.773655] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.773658] [PRP] prp_net_if: netif_rx DROPPED
[46876.955689] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46876.955722] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46876.955730] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46876.955789] [PRP] prp_net_if: netif_rx DROPPED
[46877.507620] [PRP] prp_dev_xmit by PID=0
[46877.507638] [PRP] prp_send_skb
[46877.507641] [PRP] prp_prepare_skb
[46877.507644] [PRP] proto = 806
[46877.507648] [PRP] skb->data=00000000eabf37d2 skb->len=42, skb->tail=000000009404f207, skb->tail=44
[46877.507656] [PRP] skb->data=00000000eabf37d2 skb->len=48, skb->tail=00000000472ffbd8, skb->tail=50
[46877.507661] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46877.507665] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46877.507668] [PRP] prp_add_rct done
[46877.507671] [PRP] sending over port a: enp3s0
[46877.507689] [PRP] sending over port b: wlan0
[46877.507696] prp0: failed to send over port b
[46877.508210] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x806
[46877.508216] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.508221] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.508227] [PRP] prp_net_if: netif_rx DROPPED
[46877.656955] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46877.656989] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.656997] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.657010] [PRP] prp_net_if: netif_rx DROPPED
[46877.674709] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46877.674740] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.674748] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.674762] [PRP] prp_net_if: netif_rx DROPPED
[46877.789705] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46877.789735] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.789744] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.789755] [PRP] prp_net_if: netif_rx DROPPED
[46877.791265] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46877.791270] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.791274] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.791278] [PRP] prp_net_if: netif_rx DROPPED
[46877.845033] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46877.845070] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.845079] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.845092] [PRP] prp_net_if: netif_rx DROPPED
[46877.849693] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46877.849703] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.849709] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.849720] [PRP] prp_net_if: netif_rx DROPPED
[46877.852281] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46877.852288] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.852293] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.852298] [PRP] prp_net_if: netif_rx DROPPED
[46877.852329] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46877.852332] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46877.852335] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46877.852338] [PRP] prp_net_if: netif_rx DROPPED
[46878.291355] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46878.291387] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.291395] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.291407] [PRP] prp_net_if: netif_rx DROPPED
[46878.332564] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46878.332601] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.332610] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.332623] [PRP] prp_net_if: netif_rx DROPPED
[46878.521401] [PRP] prp_dev_xmit by PID=34198
[46878.521411] [PRP] prp_send_skb
[46878.521412] [PRP] prp_prepare_skb
[46878.521414] [PRP] proto = 806
[46878.521416] [PRP] skb->data=00000000afd4e4a9 skb->len=42, skb->tail=0000000021cbd597, skb->tail=44
[46878.521422] [PRP] skb->data=00000000afd4e4a9 skb->len=48, skb->tail=00000000fe61b383, skb->tail=50
[46878.521425] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46878.521427] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46878.521429] [PRP] prp_add_rct done
[46878.521430] [PRP] sending over port a: enp3s0
[46878.521447] [PRP] sending over port b: wlan0
[46878.521453] prp0: failed to send over port b
[46878.521966] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46878.521988] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.521995] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.522003] [PRP] prp_net_if: netif_rx DROPPED
[46878.533569] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46878.533579] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.533585] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.533595] [PRP] prp_net_if: netif_rx DROPPED
[46878.544643] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46878.544655] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.544661] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.544670] [PRP] prp_net_if: netif_rx DROPPED
[46878.558317] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46878.558330] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.558339] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.558351] [PRP] prp_net_if: netif_rx DROPPED
[46878.790259] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46878.790291] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.790298] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.790312] [PRP] prp_net_if: netif_rx DROPPED
[46878.822420] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46878.822451] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.822458] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.822469] [PRP] prp_net_if: netif_rx DROPPED
[46878.830590] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46878.830602] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46878.830608] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46878.830618] [PRP] prp_net_if: netif_rx DROPPED
[46879.037891] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46879.037930] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46879.037938] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46879.037950] [PRP] prp_net_if: netif_rx DROPPED
[46879.043313] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46879.043326] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46879.043333] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46879.043348] [PRP] prp_net_if: netif_rx DROPPED
[46879.534702] [PRP] prp_dev_xmit by PID=0
[46879.534730] [PRP] prp_send_skb
[46879.534734] [PRP] prp_prepare_skb
[46879.534738] [PRP] proto = 806
[46879.534743] [PRP] skb->data=00000000e5a055e1 skb->len=42, skb->tail=00000000a7e0d60e, skb->tail=44
[46879.534753] [PRP] skb->data=00000000e5a055e1 skb->len=48, skb->tail=000000003cbbc1e0, skb->tail=50
[46879.534760] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46879.534766] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46879.534773] [PRP] prp_add_rct done
[46879.534777] [PRP] sending over port a: enp3s0
[46879.534803] [PRP] sending over port b: wlan0
[46879.534812] prp0: failed to send over port b
[46879.535327] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x806
[46879.535334] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46879.535338] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46879.535345] [PRP] prp_net_if: netif_rx DROPPED
[46880.070713] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46880.070745] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46880.070752] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46880.070763] [PRP] prp_net_if: netif_rx DROPPED
[46880.128621] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46880.128655] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46880.128663] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46880.128727] [PRP] prp_net_if: netif_rx DROPPED
[46880.547599] [PRP] prp_dev_xmit by PID=0
[46880.547618] [PRP] prp_send_skb
[46880.547621] [PRP] prp_prepare_skb
[46880.547624] [PRP] proto = 806
[46880.547627] [PRP] skb->data=00000000a90f3cee skb->len=42, skb->tail=00000000e31fde4c, skb->tail=44
[46880.547634] [PRP] skb->data=00000000a90f3cee skb->len=48, skb->tail=000000006d0b89c8, skb->tail=50
[46880.547638] [PRP] prp_set_lsdu_size: lsdu_size=34, skb->mac_len=14
[46880.547642] [PRP] prp_set_lsdu_size: rct->lan_id_and_lsdu_size=34
[46880.547645] [PRP] prp_add_rct done
[46880.547648] [PRP] sending over port a: enp3s0
[46880.547665] [PRP] sending over port b: wlan0
[46880.547671] prp0: failed to send over port b
[46880.548180] [PRP] prp_recv_frame: dev='enp3s0': PID=233: eth_hdr->proto = 0x806
[46880.548187] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46880.548191] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46880.548198] [PRP] prp_net_if: netif_rx DROPPED
[46881.788160] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46881.788183] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46881.788191] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46881.788202] [PRP] prp_net_if: netif_rx DROPPED
[46881.788206] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46881.788210] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46881.788215] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46881.788220] [PRP] prp_net_if: netif_rx DROPPED
[46881.795568] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46881.795578] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46881.795584] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46881.795594] [PRP] prp_net_if: netif_rx DROPPED
[46881.795596] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46881.795599] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46881.795602] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46881.795605] [PRP] prp_net_if: netif_rx DROPPED
[46881.802435] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46881.802444] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46881.802450] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46881.802460] [PRP] prp_net_if: netif_rx DROPPED
[46881.802462] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46881.802465] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46881.802467] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46881.802471] [PRP] prp_net_if: netif_rx DROPPED
[46881.831594] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46881.831620] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46881.831628] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46881.831639] [PRP] prp_net_if: netif_rx DROPPED
[46882.074075] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46882.074099] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46882.074106] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46882.074117] [PRP] prp_net_if: netif_rx DROPPED
[46882.136769] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46882.136801] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46882.136809] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46882.136820] [PRP] prp_net_if: netif_rx DROPPED
[46882.841614] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46882.841647] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46882.841655] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46882.841666] [PRP] prp_net_if: netif_rx DROPPED
[46882.867965] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46882.867999] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46882.868007] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46882.868021] [PRP] prp_net_if: netif_rx DROPPED
[46882.872911] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46882.872917] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46882.872922] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46882.872927] [PRP] prp_net_if: netif_rx DROPPED
[46882.877019] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46882.877028] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46882.877034] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46882.877044] [PRP] prp_net_if: netif_rx DROPPED
[46882.877046] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46882.877049] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46882.877052] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46882.877055] [PRP] prp_net_if: netif_rx DROPPED
[46883.855155] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46883.855166] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46883.855172] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46883.855181] [PRP] prp_net_if: netif_rx DROPPED
[46884.029772] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x800
[46884.029805] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46884.029812] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46884.029873] [PRP] prp_net_if: netif_rx DROPPED
[46884.031395] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x86dd
[46884.031402] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46884.031406] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46884.031412] [PRP] prp_net_if: netif_rx DROPPED
[46886.742418] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46886.742444] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46886.742452] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46886.742461] [PRP] prp_net_if: netif_rx DROPPED
[46887.748536] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46887.748561] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46887.748568] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46887.748578] [PRP] prp_net_if: netif_rx DROPPED
[46888.761905] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46888.761931] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46888.761939] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46888.761950] [PRP] prp_net_if: netif_rx DROPPED
[46889.775083] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46889.775094] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46889.775101] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46889.775108] [PRP] prp_net_if: netif_rx DROPPED
[46890.788174] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46890.788198] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46890.788206] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46890.788214] [PRP] prp_net_if: netif_rx DROPPED
[46891.801467] [PRP] prp_recv_frame: dev='enp3s0': PID=0: eth_hdr->proto = 0x806
[46891.801490] [PRP] prp_net_if: dev='prp0' @ 00000000cdf18063

[46891.801498] [PRP] prp_net_if: skb->dev='prp0' @ 00000000cdf18063
[46891.801508] [PRP] prp_net_if: netif_rx DROPPED
