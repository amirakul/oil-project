PGDMP         :            	    x           world_db    13.0    13.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24686    world_db    DATABASE     S   CREATE DATABASE world_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE world_db;
                postgres    false            �            1259    24830    conflict    TABLE       CREATE TABLE public.conflict (
    conflict_id integer NOT NULL,
    year integer,
    location character varying,
    side_a character varying,
    side_b character varying,
    intensity_level character varying,
    start_date date,
    ep_end character(1)
);
    DROP TABLE public.conflict;
       public         heap    postgres    false            �            1259    24822    geolocation    TABLE     �   CREATE TABLE public.geolocation (
    name character varying NOT NULL,
    latitude double precision,
    longitude double precision,
    country character(5)
);
    DROP TABLE public.geolocation;
       public         heap    postgres    false            �            1259    24846    geoconflict    VIEW     P  CREATE VIEW public.geoconflict AS
 SELECT c.conflict_id,
    g.country,
    c.location,
    g.latitude,
    g.longitude,
    c.year,
    c.side_a,
    c.side_b,
    c.intensity_level,
    c.start_date,
    c.ep_end
   FROM (public.geolocation g
     JOIN public.conflict c ON (((c.location)::text = (g.name)::text)))
  ORDER BY c.year;
    DROP VIEW public.geoconflict;
       public          postgres    false    201    200    201    201    201    201    201    200    200    200    201    201            �          0    24830    conflict 
   TABLE DATA           t   COPY public.conflict (conflict_id, year, location, side_a, side_b, intensity_level, start_date, ep_end) FROM stdin;
    public          postgres    false    201          �          0    24822    geolocation 
   TABLE DATA           I   COPY public.geolocation (name, latitude, longitude, country) FROM stdin;
    public          postgres    false    200   �c       6           2606    24829    geolocation geolocation_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.geolocation
    ADD CONSTRAINT geolocation_pkey PRIMARY KEY (name);
 F   ALTER TABLE ONLY public.geolocation DROP CONSTRAINT geolocation_pkey;
       public            postgres    false    200            7           2606    24836    conflict conflict_location_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.conflict
    ADD CONSTRAINT conflict_location_fkey FOREIGN KEY (location) REFERENCES public.geolocation(name);
 I   ALTER TABLE ONLY public.conflict DROP CONSTRAINT conflict_location_fkey;
       public          postgres    false    3126    200    201            �      x��}�v�H���)p�]u�4��?.)ʲe�4���N��\@",�Ln�t��6{����b�� �2#����l�3�j�R0�?��FoP�o��M�-O߼+�e��%���#�΋��MZ:��[�9��b�����.��7㽳����q�h4��׬t^��|���r]���w��WMҗ�b%}�M�n��7�/��ow��L��q�K*�D\|�7#,������.�=�ߍ�CC���1Y��,�c8�^/�j^��|&�v�*��Nz�Y�_g�&ݮv���:������s��˫��䟗ȣ�.�XM4}��z~�4sY�P������q�?���Y�����#B�(�#.qW�٦&�a�ﳕ�1�>���7���9��v�=��w]���I$"c&�.-v�;��I��V��09�u�ɿ~��d�ĝ~���E���\��ⰓW�=t~Z��lOf�����(3,��,���Q��������||���/���i�\>��5�}u=_j�%��Ft䞱�򜢓i�'���mq��~���5��o�T~�ƛ�t+���imS���iu]*�����7ަ/̓&:/�v�QX��%��Pө�����u���c�z3��@!1:��Α]�Y�ΑU���c&ߎ�R\�P��5�n�\��(��	�yP]���}����%̜|�;���Ý�̺�.ET�o�i�J������AO�S�H�ҥ���c�w��!}�o9���ׯ�.'H�y*��_?�d�eV�}�æ(�Zh�s�Qr&���a�?���	�ʕ�����
��vU\lQ��VU\<���-��x ��*�d$�����;y�"M�ZlY���g���<�B��V%>>α��x��n_0����C���wM���'���X\]8��������s����8͹"*�s�D��zD�&�]������3=����і{� �/A|i܀��ύ�ȟ$=r�`�R޽�z�*\zP��թGg4�(Ӧ�T�O�N �#݆�(�r6-|s�}~���ɢ�.������CQ��m��]��|!=^����U녀���i�I_�3\����i[��Nca�_#$���iV��5��ύ�X�-�61�k��6	��ذ�H��d�X�+K61�o�l���H%��ص+.ߏfj���a�,#aYL���e1��e�|����r�p� �8Qu�,��䏡�&��J��gҎr���kyY��xZ�[�Q֩Z���6.\h�C��^�$ԕq�|�UӞ���p~�>��a�Ul�ڹɁ�����������0�7�^��2c�C|I�~�,�'��&����Ϙ��bE��A��kɊ�(�hߊ`��Z�/�nE�G�Ŋ	Ԋ`�V���p���{���_^��W�Da�)��#!�/� �K��;��R�^���{�z��#2,���T#�?>?�o��N����)U�]�W���Я�Z�o�����~=��Ƒ�	 <~~��}A9���>�_�x���/d�� K�ٷ5!�;�e@],�J��]�Rs`��~s'3`�%`3����� m���C�W���+��V�e�u{�D�?b��8{K�]&��۫�	��c���v5�I�٢I9�%a!Vu�kIg��Lw���3M��ә���Ig�~�t�֗|����At��Cu�k[�a����1۾j�|����4��UϊF~g,��FBB#yi$o����L���H���I#�~	H#yi$o����T��Do(��
��F�%�LM/��2��ɬ�$q`,�o8=Y�N�����]�輣����(����������&���D"���&_�{�8Ԧ([��o�\G�i}����e�u���"��dd��sQ>q���s��
g�/�l��f��?�^q���^M�b��t��5���N���K@�ӷT�sk?��x�ׇn�7I�M�����|�)ȑLe�\� �/���}����`�%�(9߾��2o�39�����$>:�`�8���t���N:��K@:!����8Q�P'*�u���NT�=Q�F3U����#.�N�����U��ꐖ����ӹ#��V�s]����x,��[�/�l��x����7������ʎ��n,c6�������{����R����U�;�21�->��ݩ&58��[mwn��4�r�
뤔��AʨMX]�&�;�UbO���^C�����zC���@�*��K�ՑH�H� c����6֑����4N���'���?l����(���*�馁r����l6i���;��lr��哒���?����x�?}��+X��6THoC�u���`2� &+z��|�::�*LY�d1�5�Ӷo:�~P����u�qgs������]2I_��(�w�r<��E�&	��	y_lW�2����Y��<aM�E�@�#q(1&��u�w'�iD�+�kD1˯i�m�B{�]�w٧�}DS�Ŀ�|Sf{�0��L�^Z��������T��F5�֨��a�l|�Ch�X�a���ZԠ�^ic��g�KF�1��b����	����~,�[��m7+��v�M:�n�;�����GU"�*b���H�M��g�<jpqPu��s����j��n��z�}���}	�:R���@�5�?��Y���=��4�R N%~�P��fhV=n e�����.Ki�}�Rzuo|�Lݛ��M�ʙ�T�A�I��:]|b�:9�����:	��v+��NV�zS��
'=tr�5x?�������G'�\.�����v}X)��[oP%ruҐ�D���:ۓ��Z���V7�v֗�QR�,�@Ui��ƐN�K��Rc�f��X<H���/��|*,)������dK�%L�]-�M���"~b��K���,;�Kzge�'���5�_�孬�O�o��gRl�翮�����>���4/��ϐ����SQn���Ҽ����F�[���y�U���J1O��3�ʃ3�~O�x�uxa��!�5��kZ?C�l��p���~\Z�P������$�)�Nc,�6�/���&j�T�Vmv���O�ùZ�}������t ?��b���}ʛ�V���@�+Z�K�*��Km��i��G�q�|��4���Z��ƕ��E�?<cu��p|�L�5aBD��?��5߯p�QY���>�>K^��p��m2o�6���X�ш����꧱�r#Y8�Oq$vhu�x�L�{ѭ��q�ܰ<H=R�Ը�D #�0}��ri�X��2�]�jM׈I��Z�SB*WU��x�M��;Q̜�ݳ2��#l���φ�=l��_M�򍔽�
/g�cYٻ�({$�����ʾbn7e���wm({$��kC��=uU�Y���;X���[�N����%�}D��#�ՠ�=]eD�᪵���`i`k}ݎ�䡓�%D��6�~Ȥ�w|��M���j$]�A.�KY1S�J+����b��b���1^8rۈ�����<����v�~*6E����:]9a�0���zDi��::�tw�����g(���3�,T^�3�>?�\�|��ٞl@kV��D�~�Գm`�b��������Pm���J�AͷYzy��v�m&���w�=�xex<Ș�-�'x�iPB{��Mnd�*�m&���pyXI�O��ry��.|:PZ���r�*+���!l�� ���g$Iu�P��$��?�4�eCg�^a¤Z�)"�[��An<߶b�-*vӕ^.�Y��Ď� ]0��V�4h*���t�Wڎ�^95l\o�$F�O$dE|��4�����?������odZ>Q�[�AaID8����G�_Ȟ���Q�ξp����x��+�P.ߋ&�|3M����c��C��e�a&,c��m#��u{�\��}Z��Y�K5b��	�x`r#��ycyn;-���Uv��o�b+U�d˄Xy� ��zV &~�0�ic�x!�����5d�Ao�\����ޭ�O�sY���;Iɞ�� ��-�aA`��-Db��3��I�b�����d��!4�MC`�+�ش�͚�غFL��|�k��S=�x����|���qz.^�������^&�M��.^0�z���s}��_hr�m1W���ɲ�/��ʥ����?�Yq!S�t6���Y)�V�    ���+��E�ay�	߼�X�⳧�x��n������}ݱcp�
	͡ͅ�7��A��T��	��O�!�	�A����}�N��4���uB0Թpf�� �c�Ħ�'��xB;�'��x�^�	��ޥ�3�A�_���Y}���ɚ��΁�&�|�ʜ��<l̷�cP����h��z�N��%{6���-�@J�S{ә|�Br�XZi1��)�$��B�X1���g�=+�?Ș*<�$|�ٌ�?�r�ʳ������Y�E�Y���\���e�Z�[g�Ow��v�[q����ίY���E��x�ݰ�ҋ#pimȐ�f-Ch1{,\]�����uV�>`B��8�`g*�L���h`g<Ն0.��ԥ]:���IB��,øH� �����s���,�MN�8f�q�cF�` �"�J��W��H7�"��~�ҭ�|Z���K��9�8E6�]�R3wH������;��꤇���bLVb�Ӈ:|�W���i�B!;?}L_����N��q��-��C������k*�aH�t�G�P����U�~.u��7��A|%�_�����]<v~Z����?��u<hZK��$�n��
\v���]JG4�0�o��M���Smc{�P]��,�Z٨J\�m���b �tmMQa{$PRl��VA\l�Q[�R1��Ė�����
���?����?��)��bS�S�x
z���bk���啘��f���o��%�Z�L�r����0�P�
L�93&��A��6MU��&����]�%���dpc�\��&�nԕ��M�w�el�X�&�K��Ʌ�\��>��<,̀J{�2��cb�$V1Kb�$61Kb�$����@���n�)�ᐅϥeđXG�P�c��s#׵G}�	?B����n�����B�86�2�|KWEY���T��DM	��z���2���n��%��<�PX4���D3W,�
�:�F�0cѴ�*�q��1Ac��GcѨ?�2�1�ј����1,��h��s�Ge��HdT��2�ʰ@k��x���2q��Ln���F�R�(Fw�5(��كbd5�A1,�7#2zB1�c�%�,�U��Y�YL@�X��m���AǊ���98<@v�uLE�ڃ5�n�E*�r�aЇ��[�A�� �j�5 ��
��o+�+�v�
��`VX���+0����_d��"��ٴ�����%O�B�S�f��a��F�c<|��k�4�m��@V:6�\3*̠b����.����B���
A!�aE]���4]����)��N>���%m��K�xHh�Ʈ�⩲�x�N_�������y�}?ϕ�n1��×}�\��|���������{Y�X�n�H��z���V[LK�A�<<��U] ����U�_�+�}	���!��j	t�/;�p~�7�<�� �p�M�N�J�P�N�r�&��T>,��۬��C�A�}�.S�	��q�2,�gb\v�, ���k\�V��k\�<c2m`p��1_�Y��j�S��9hO��$��S�m<�����d:����_��M�=��)v9F#����jw����]��s
���U��-����f���`��|�*@������?����֛���ӻٟ�_S���]��A�U.�OM��3�a��wƺ��E�@��&�"��P���:6�?��]4�����.u���\��E�;�[�qE/��bu\�uQ��*4�.���,&G]��.��s��R��=�}��Gi%4+Mm�x�A�7Hq�g�6x��>��-�B ���{�� ���Q�01o��G���<Au�왲�9.�}���m�w��¹/��1/0�*�3z��.˟��0|�/*#��Z���G]�d��TĦ��&��PP
4�T�6��A�K�g-���cM	i����~��6'���r�g5�GL��:�I������d~/oD�3����o��v!���Ow� %�5�~��F;0QW^6�$�za����1���ѻd.G�b��Q�oE�C�:�����;�&����9.��
M~ D��D� ��o��N�����U0�c��\��'�7�TL���g��s���eWw�y�n��x��@���o}Ьvr�I�F���8�C!m(N�RM�'���.կ�8	R����9%�_wFI���P&xT�6�\�5���v�=�[��x:[ʝ�N�Mbu�5m��[P	T暻s�]+��u����;��{-Ý` �S�5��� !A7�	LA�~p�p�n�7)��uM����?/��� .�4�V
\�����+\��%��Fl���������y|��oNf�{͛`$Q�B�*S���n��E�(���2K^��T߸ał���bn���`۠ԫT�B��H�6S m�M�֡D��u)n�L��Z�
�Z�)�m��Ż;õ�\��k��ݍ�&%�M�K3���B��j/��1���HK
�,h�؜L½���>�ވ�Q{����G}�T�!�Lnk2�X��I���ZҠr;�28������;�����Dy��0��f��5�hR�<���X���֛�w�/���_h��v�_K��/����M`:�e�ޯ@����i!C{R��*��mCHS;���M١<�Bv)Ln!�k��t��RB\�#!uÍp��kg����EYA>��� �(�}�@@��=x�.@X��^��fi\�p��R~�������f`��t���7wr�ѳ>�|V��ye$�j�&v���|cwչl�D�
۬e�!��3 �}�+��\#��5�\� �-�z�>���"\���W]��S9��6��a=��ڲ\N>XdxI�1!��B&m�s�>����Ͳ�.�H�Kr�+�ȃ-ŧ����v�{6�����Ƶl�Ǚ����61z�Z�z�>p�xc�*x^���R�]�!�ۍ๺�{gx����eaHP� ������댤�ؽ��;I�*�w@ұ5$-��D���cU����a5�1�#YPZT��@�H�j�Rㆨ��N0������D�b鳇���(7j�(�W�"	���y�J�`>��"�����1Đcg�c{�X�Y�s}:���N�M4�����\�2�Ȝ{L�K��|�ʴ\��=�O��k�K�'��mCC����:!�-�"�����}���@Z�l�ܘ��ʙ["H����)���tu?*r?�Xʸ��vQ�vz�2\#	��f׍��G��@X�1�	k�p>-J�H�Eݤ�3wI�p�
 ��x��-��`�+ݠ�2<
���� �?�ݶ�D`{[��n��8We�_g�(VM�h��
���8���8����t�M�-�T��#ENk�K��N��@� [�ʖP�4�o�w�DQ���
�}�P�qi6��xº��#-mz����e�@Z�P��N�GfjtNB�b:��HB>�/�__��e�-�&}�/_��0a(���76jd%�V��4����$��'l'��v��b5<����t$cR���)Q��x>��CB!5���,�)Y���<���R.�� �g��]ٙ���ۈ� �°���ł�!N��D��5��� w� �%N�B�So�!N�s  N1���9q��}T�',�q2�Iq���I��i� �9�Ӏ4��=��,���V��T�xo��b}�mz� �Fˈl��,6�K�c`%�cX���=�d�T�]D�m�Ev2�v�LrDN(�0+������WE�A��6R��1	�	�G�HQ��IP�h�dN��*���{���0
��;6u�mdȹp���[?V�\:פ��(s�|H�)��Y���i��4|���]8�t�~?�Л�Q�1\�)��cG
�O0�m)�\ɶ=⧀V���@<UU
Z�/�l�\r�����u+F�ZG�
�tG�\ȱ/�t����y�H)��#�e�m�4>ę�`
J���01J'���P�Cj�@��Y���\��u蜥gm]e5�s���R�.ݬ�T���H�L���UgƆz36    1��JԄ~�u�?}c,������g�~] j�hd���S��bd7=�O�;>�CE���㇬�|(�[g�����c'7�f\ͯ��b�vW&�Y敆����E� ݎ�pżpf�Qtpn"���0�����ܝsPd��������=ag�Wy0
�20��O��	e⩘5���?:���slo���{���t�=]5r�?2gE���UՑ�Y�O<��#.��wmwVȧ�]ڀ��YݕK��BF�3�;�_�ɔ�&4�r=Z��j��}z@���^�ci���C�K�^xФ��Z�9���KP�9��"��MsG$S�).����~B:>,f��TS�0��j���u��X'�� ��{#[Nn�7����o�z��q�+��wYMi�74&���'��>���ψ��_�m���I����UV�΢�M����$�Ŋ��,�T�[2-�u�b���Y)�*"��y�¹;���b'7���-�o7Au��Z4�HpU�.��	Nng���T�т�C��
K��v��4.������k���#��T���lg��Wt0��Z���=����ڏ�����?����ꑾ���W'ݕ��7�䒞	��򛚳���:8&DL|���Hm���ۑ�V�niռ���d�K�)-A�ܑ�1:�H��vJl?����'�c�}�`�T������K���OO����mLgtB�MQ�� #A����U���&��CY5���.mdUA�n���TH�WMU7}��j�!���T��;�*�Zji��D-�X��S�ъ��L��̮�^+|�0PA}+W*�����%OY!��nAҷ_�ߝ�l��m��v�{Z����,��|->���i�X��"�Y��n��V�WaE�ke/�w�?+��(�]�P�CM)��.�!?��PP�*m�=)hK��T�
�	
�Y���=
��ݏ�z���?2Z�����e��˅U��"a���w�Q������UQ͊��LG�i�L�	|�Y����r��^��ޕ�0KV��)�?�=��!�KF�^�4��P�{�e�e���݁�mɣS�H9�$�5�.%�I��a4<f��m{oR�5iU#���W�׾E�n��"A�;tB7"�]ڡk	s�v�AK�ҹƝ�7,�j�v��Hpg̝�*m�.���C�E��Sݭ�b*!�y@�3��~7-����f�o�f�>*͍����㺠�<c�l3s>ov���fMлb[�Ѕ�J�խ�1!6�ۧ���C�}�Tب۹	��Qao=�0
�ۣ��P���ל���q��3�U�q��8�ߛ�V�T��R � 8��~z�e�ܥ�/ҫU�����b����lZl6Q�WYe$�Z=V��o�t��ː�e����-�|K��/�k=�=��..�^�o��[=DT�[�J���چ�4�j��hl*D�G
��ָb`�+2��ro Rө��i2�������^�uA��3;~A�섔)K����0�*�M����w�UPe�U�]ZX�U� �*�VViU�I�I�˴*�F�{�*�N��"�l$�{¼�;��]���(�N�|�Y�_��̘.�4�M�c�s� ��0�"�H��~�N~��O;F�_0�wn�]]i)>��S&I�ڐ!9��c4�
{R�p je�)D�L����6h�
���p�jX�o�˜抸t��Y�%=Z�*���.��� �SQ0�eR�]���TȈ 5{)��1c�楆�(����?��A'���viZ��i�SQAg~m���[8c�2�vKۓ���[h����[8T ,�7���q�p�\ΰ/��s��8���b�є���9�I&�vD&U�"�*�d2���1���6�K�:4hx�֞7�E+�+�w��2�����ҟ�tv�e׀�]���-�X��o�� 1��]��TV�xAT6�Ie#8��p�7UiO1�?Ǐٖ�����zx�6�}��R^�R^�!X��PP��x�*Y�ґ��V����5�OK�Iu0:���]�bޑ	�6	~��.��Cg��������ޤ�r��\�Ĝ�m82� 2U�02�%ӑ�L?̻��h 2E�#�d����$ӑe2Y#ӑ=2E����I���ɴ
���t4��l��v5"�Q��?p�"Ӫ��i� c2Aɴn˟��?��l�j�%>t/umZ=^ʳ3�DnCn+��y�������V9��*��y!RC��$䏯���G��R|��z���q7�u�m���� ɦB���ޯ�!|9�Ɨc�g��[��)�4�_7�SR�bK�T?B������I���̍�֪�l�+Ta�kl���J�zW��?�H����E��xk< o��⭱U��n��V$xkl���}y+�5��[�xk�o��#yk<�eǸ#oE������[\���EEa+
7���@�iW1Ъ��J@���������Zd7��@c[��azD��aH$Ç@��={qO¾F��ؑ��Z�X�2�����kQ�����}�_""��=�!��jy��C�^b��%j�wsGH�y�N
N��ŉ&���Z�i�1����ji�ʋ�.���Sy���RڈN�	$�y}�>7��:u�3��i��iV�+g�=vy���9gb!
y'�0h��b��	/�3�<�O��l|O<ߊ́L���r#g���7�T��f���6Z;]�cJԍ�r�� 
��0�X#�\����ʵ�-V�l�f�]�k2 yM�"��-��5�5�)�XOf�3L�b�	��d{��I׫t�/ i|SZ�ۑ�J��+����o���1�H��3�+$)#�.q��.�4tA���D=�H�Pf&�>Gu�.��1��W�a�n���L2�c�zr�� �0�>T��i�������./��*�{w$$dE��ya���F����J/�M^�-�o����S�;�S��^�L����vO��:.T_J�1�{�}����W�gJN���l��]d�
�0�L�	�nӔcx�f�s�J���茯�MqY��E��Q�h��?R�.y��1��c��B�j6���ԧm,v6]�QؓTe�� .j��EW0ܛt������l�e�:w!�"���DdM�(;���(h\fd������+('�l�r�7�$�5��p�	���["Q�6g�X�M�I��b���M,�6�QL"�6�$�N1�g�K��+�4k�RعA� ��dPy��t�MO�;�J��#�J�߿?%D��c����,'^.U{@���*i�-���آJ)^��H�fHb�}ȣ�{ߏ�n���*��Ө ͏����95ҫР��M:»��>H��-
�~=��,�c>lzd�^��JV��[1"��7�>~�<O��	��lđ�f� PM��GS٘�?�r��Z.~o0J��ͼ���Fh9��a��=�u�+�No��(q|��^�Wsq��K�:?-�oy�'v���������C1�dK���D��1m=���a<�@��@Gā�}�o�U�����xL嫴���u��tsɚ�gٶ��"���/v�&+S=��E��D�˒�|�ll0~��U2~<W_[z�},6�:cB�
2���4� A�w�}'�T�hN4YO,��ed�[��٥�=�d��=��遃���3����`*T�g�],e�@\�v�H7��_dG@\�J�0�A��Y�S�~~������j����Ə�jW:�iY滢=rq�l@���>�.�֠����/��x���:���k�>���"��>��Ø^_�� F����9�*uƏ�iݍ���@�`z�ҩ�����ٰ�z���q! {.$\Ȇ	��B��X�ޅА�|�7@C���~�'�Ϸy��MY�W��Sr+_���3aI!�h�������׃�W��ݤw��H�k�ʯo2�+���FZ�-�8�j>M�a2Hn�����v��,�P���$G/�&�]V���P��YJ��6���O���UI��5S'f�b���B㋴�8��cUJ�,�����YY��]�7a��~�����&��^�=���~�q~);EN�D���2+eT�:?���\`��-OϷ�r��i �QY�A`������J^��3�j�#i��o忠:h�X	 �|�ynpɊ���    ��X����i���o���A�9Sy1���ܽ�\JǏl�|*�[��w<	i��l������.�"�+��&��=0z���=���{���nʒ��<�����M(�����Uk��p��8�2I�G»a*_�ݨ�� 9"��[�@��ZsD�=H7I�=w+�70�D�|�u� �"kdh]}$RPeG��?Ͷ��C&���2
�g������p�%���	���	��^m��p&����¹��_8��kI��p<]����Y�e` \�]ׄ�tM��Kw�^Rf��%e���Կ.��<�5-�}�>�i�����IN/���T� 8��}�~�÷�!����ۊ!J�[���[�4���*���b�|���!��u-1ZW�hńh�ϗ4�g�U�2��R��4��b}n7Z)^�(�`��հ���R��Ԇ�򸛱����!����LNId����*v�rS������=����.O���9��NG���b l:�%��ՠ
��2��|w}�/�3"�������u��ak1�-��g*��*���eM�֥h�:�_��ͪ�V-�Χ�"�!v�,�G��Oc�����[��k��ы��o���Tyj�e�7p����������Y*���t&�`�{�%J_깔M�X�>^�T+�1��_�j�p��=��г��La]�D=�40698��;M~�,==�l���N�#h��|L:�9�K�8d��Nb�� ���}�wk���Q��2��6�ª��XV�jχ�T�3�� �~��� w�Ur�z�.����y�ɝ�7A���r��&wU�гF�B�ft���yw+/�)w��Gp��y< �1�7�s}�����nY�ts���?�$Ǜi��W9vI�(>r&��l�L��Y�NO<=3/	��My�Pf{��s5��I�z�֨�8��m��a_l���s�%y�����%�����Qk@�Z�@c$�z�}�{��"?�9$�Ā��α�R����.}�$'�g�]/&ulO?�$q��|�!^����K9+�-���H�7�{]Ă������
��h�o���L�����t�t��/�:�:�5�a)w܇��V^-�RQ�]}=�9����k��a��B��^��-�I#We�]`���z��DO�y[��������}��l~j,��Œla՛u�Y��)���J�֩�0�mYŷ��Ӭb����y �I�ϴ�{�!���E�vY�eъ=*#՚O#�)���Ct$��&��Y����C)n#��6�7�8f����ݙh�f�+��t��o�/{1eDՇ?�ko@N'����>�����U�f��k��&����"@�����x*�$=�}�s�ΦF�E���~���U��� ������F�L'���p/�m}��cX��UƸ� U����A_*����o?�p`�}���<k�p�ԣ��c�>�ˣ��X*o`��BOf�z��MQ��ޠ�E⊣?��^`��!#��j`���t���(���o��U��]h�J���i+X��m,VԀ����Ī����i�6�5�6����P"�D�52��+,Q� ��4�4k��I����ݏxV�,�F�Ԥ��i�$�}:4Ui|J�O�Mj��#��_dE�뵜p-U�]�d嬨?,JJ@�9��]��V�L32p5������H7P]^/��k���	�B�k�� ��j:;�;�aG��3�b�\JRO(\ȇ5˾J��=��g��|��cm���Lsy6��ݞ�p�`��O��yI�p�\ߩC�#��Pq��
�
���fh�n�����tήIֶ9���sLJ���]�̮T������BҚ/X�4S@�i�9/���eU'�z�=�g���T��n�|�@=C[��n�ŵ+#�
�����aU�`6�^����*�9�˕i̱�6���3�M8n;�S��n�/̋2Ր�.E��Iv*b���,p<���"KcZS��4s�"�1#%fUŌ�
Ej�l��ى�0�P29��%��!.�	б�
ޛ��G}�=��Ѡ�<�s��b�o��X���fv��|�%Yb�~��ٌ0E!dVd��>�(�U��,�mZ�՚��m*W|R��%�h�:���JĀ5D���f���V�)[���e�/% %����0u.��T�!��Q�P��֩nTF@�aD$��#El.̊����f��}Ȁ�XDd5����.�_%O�#>�>(=��WI&�������o��	����?���P�Ӌh z����r|\V�cV����"��"alU�s�����b�[q�cG"�����7�T8�ݠ��eJ�����5SU��nUU�_J�C�n ���RNE��	8�'�lU!��������*$����n�#��j�����a��?��M���+������ <O~^�\_;�>V"z=��m���"��m��V��L����x ��`�
����QS���)��v�i���iU�9ck�!�>�z�\�� ��U�z�.�_%�c=�7�H[�X�{q `[ȷ���2���N��3�*�+�� ��q���р
����@��_8����~�o��?(tfK��i����#��Y��*���:`8����}8l���(��:#/�+6��6��x�]�yz�*K�2������O�4����wٮد���T��O�!�i!q��eO&*���T��{: 	���Ҥ��Kl+����إX�N�t��1�%�P��?%J�D	�u$C�������J�kJ�󢊨@��$p�D�Q����F�@�W��$��Uq��F� ~p�
m�4�2�QyL:5*r� �E2;J��#�KvaG�I��D�н�it�W�_��R�A�q#�}H��)�JtA���N�,<Y(��7#�Aӎ�Ѡ�E�5av���cT< ���[z����rl�_��:}̝���7ɬ]�M��8��i�?�������rq]���1kd�'�N�DUDi���@ғ� ^r���-9�H�k�$Qa��P^�]��ӎ��'K����d~{9���p�@���sy��pX����~ӌ���a� ��J�G��A�!����P�-�L����)*D��F>%VI�7�ј��.n��m=Q���g���R �s�H�[&�Tf� �Pi��;�� 4M�x�4�I�HӸ����xz���ʲ�#e���i^c~G3��%±�i��Q��ښk^���)(�9�ӈ0>!�7㣂zfԱ�QǤ�o�\8�,%�Xcx�^}x'!����Y�hz�l
g��"�U�������Q�ʁ�#<0u�!<|�����lC^��L2�h��8��l�t�O�lk�_�B?�/=��}Ff�����隀ȇj�pʡn��)�.�������Z�]^�P��L�������L%����D��{APw��I��$��\Υ3���L� $Y"	�2I@�HTߛ���Ғ>g���E=STj���ѱ�W���F�ͪ=��G@�9�j��CAy0b�l�.~}g�q�V�o��b�=� Y���Q�y@ݥA���'���t������_ۯ��5�����p>��Ϗ�t��`�굸��v`u���S�729�H1��x�/��Fj+�N7�I�f�^L�X�ׁR�8f�wc7�Z��0�V|'�jr������t�H��]�	�j1�~��y>�?|�=��k|�}o��i�
1��*P|�{U%v�k�ʮ������f����f�h�P����=���&��[%�U][X��c�6'v�]��p��Ysl����"��5�a�D�*ju{�֣���ا"�9W���{�
Q+0�9C��H��|D\��~+0��x��g���|r�����Ԡ��҄4u�0�R)��(�<���ZO$��7��X5P8�Tw-���8�X�/�MT���OEw��H@A��ug���� �y
���-6K�;9M�^)B&�FZ>Q;г��Bt��BA���AA�+=�û����v�t�țP��$��^�F����1U��b*g
1=�    �����������Ҩx?�%@�h  W��0��>�! lė�#�T^{�%�o� Ej���`z�'>�U=uzSwÔ/��:�7�Xյ�x<O�.�[##N�'R���N� U-��pQ�F� .|��J���0M׫��r��;���:��s�T욳.m�{l�R]�r,�Go�wM�>�gE/����T�`(S���l��k�_5Gawf�#�����І�`8�l���䥤O+F�Z�O��܂���Z�f�Q���j�V�a�����i.]Cd�n����c��-ݤrl�U�?	k�F��~_�	���D��6Rʄo�wYQ>K�OOڲ8��Χ�.�7�4�[�=����s7"x�!y�>(O�í�g�$O��Lh��q��b"�٩f�z���K`��.W5��|�����m�M��m��*�c��9���U2��;CyE����t��IW�n]���W�Ӊ^~hb9X=(T�[�_\a`��+l�q��U-*�e���P���M̤8�{��V���]�p��Y|h��%u>�0fXjp`��y5��J��K�<���kk�pEtM�M�A{�͇��e)7��]�	k0��!�W�,�r�_�9Q�� ������H6�mW��1�u�a��}��}0�.��q�[���F�Z�`ؽ؄"�jdVzPD[k'j�q.���>]m_`/��~%E����j�zx��0�<��p���n�Vp2�I�<��f�9
$��A@Ҽ�( H�zK� Iu����O9�,{U����}�K�R�^	C�5<�`�y�.�@���� ����|��V�����IUm2�AwR=�S�%%�������x���}�S�(�a?�Ĵ��tS<����>�+u�<��Է��AJhwSXZ��)[:e��x����-��V{��Ŗ�?�%q@ V��v��ٯ�o���Vۙj��,C��&�j��!���Z�8w�<ΰw�2�d_��y�f84�-�MC=p1�mfڟG[퀣HM7+i�A&jE�{��#��u˛�I�:4ꮩ�1��(`�z���.�q�ƶ�'69$�w�=����/��d#$�<mKI=ʋz��+TYBu���]p[�m
���ڛIC8e�Ez�ߚ�
�ެ���͔�-��)^�>%�����\�xDB�n|��>���XcGER����0�57��{��Z57��(@_@���1��c|u-C��Rm�W"���+q:�}��U"���M,Z�9=<����y��1�iiR�KVӊ:\}:��^���=}��^>:	MƧu�8��v��X�M+�j�bb5�_�kE��$R������Q�H%P�*Y�zE�z-�[C�gz�k�1$;ְ/�l�RaUM+���zȫn�rl��{�\5Ȓp���|������o.���1M1�퀐c{Y�ސ�z-��I@�~+G*�7P�ڿQ#��@Y�e�_!?yC$��0EC���W6��F��t��!`� P�f$`s�6#���}O������H�y\�Z��v�u\L� ��9iW�	'�^I�x�RWB��M{����	Ϗ����n.59�����F��3�����1���P=��n*� i����v�Ef�{>�,�p[�z��-�$���R'���r�g���;�m���~�{�ϝ߱N���9hxtlkhp�n��zo��A���!�'�A}u���	���� ԓo?lط!������^ٚ�졭)l6#�J.�j���y0|�0�J|�D	/u�A�r��.@Z����ꎤ ��S*wxվ��e&����_9>o}�2&��8+����p��4��\:%��Z�]����c�~�CMg�c���(�GC�ld��],d�D�����	`萶oc9V�6R7�� m4��� �Q{붛��ݱ-J�!�~m:�M6���������K<,�K< -��� Ym�fȒIȢ��l�UA؀�Y_x��x�R�
t��]ƔZ�C�^^*H��w�����ij0%zy�8�#�a`�9� �G4쏀{D
��[T�D�;��=d�ڭ;����M�C��Aֿ��F_jL'5��t'�Z���&!����7�bO������0�GL���a��)%�C&�.|m�؈������w�j�~�/�ٽ��6�"��U�~-uSc{״�"�~UeL�/2C��y�;���[�ޞ���w�%o6B��$L,!�.���h(Gq�1�f� ��m��|���9ى������{��<�V���>�/_O�voT�u{FU-����ep?8y#>3�W���3�s��$��k)��m��$C���:r��@����J؄�����S�L���rd���6}�Oct-ݎ4ƈ���xS�݅K�臘�Sf�%���0�H���5�ɘ�� oQ���&S6b�#�ߑ�F�����f�v�^�^�N�
o|�`'F����ԟ�0A��[���!��NHN���" 
1���0�����f[ꝷ���*+��Nn�'�\���&o����pi�6���mG7�I��;d��"A[n�(R�[i��bL���X��i�ňRuDR{�@�Z�P�jfx������oZz�7ȏ������������E�6u�����p���C.�B�ޑ��r�\���5�3��?ٽ!�ao7dvՆk2�mi=�Yh`MئƟT�9�i��j>�$4y����Q�*�ѵ��i��4Mō
_�&��32 6����"U�x�y��O���1)�Թa������R��V��O���'G�7�f��|{y�)
�o����<�3�����K_�%�/��xM��נ�MX�A [�3�E^Ȏ�J�2�1�a���z,�`��E�A����R������.__;�޳���i5H>��l)U�tt� B�u����U�C~l�%��.ёA��'wx�G%;O�C�˾�����a�|xĊ��e��߰�U����P��s���>���Q�D�?LJQ#U�DBEt��H���ķ��p��ƈB��S���~�����"ۦ/�4�蘉����
Nxp�T��=�ޗ	zdؗPA�b��zV��a{�wnP�6{H��7_H����
��/XS�����	��N��z�Ji��n�;_�E@�ש��@��9�����y�J�!s�8�(����v�7�����.�_s���G���8l���������:9��c�?l�QqA>���e�%��×2�v�~4��)92'�f��=,I̭Z���������D��\�`�hi(֖��F��q-0._���.�ߊ���嵽��B<��)�S-��aa?w�v�!��wD[Q��i��v�L�*Oz�Rݪ�yJ��	%�ᔐ�.Rv��8�c�G�Qw =���Gz�i�
��|sۦ�U���hN�Yl�`�5]����_��졡�(�7��G]��أJ��c�F�Oa�+U����|(�������zʸ=���Ma�Ku+T8�5A��,tB��?�D�]��U5᏾�H[��lJ�0Y;$T��*ٻ�(?k�c[$ӌ��ϯ_�iK�s�_��{�����*�g�*�Q|�������5�_6��u�����`�|�撺��
.YeuY�)N���bl��W�ObdAz	���9e+u<V2���A�cБ8���@O��#?�񫀩+�d�(�	j蔲�&Ā�!�^��;iy�h˨�<��0���n$ӓ���5I�.*$
Y=n�#$�$LN{]��Y��G�r�����F��d� W�RAE��@��̮�G|��P|̶�.`������������Fʏ�(�M��"]�_���Wk�	��}�Ӓ�:ٺ�hd���ʫqN󔌄�JF\��� �#�+�KM�Q�[����6�JOJu��B'��y�{RN��SL�M<+���!1��v͆1x����1_2���f~Ք7����w�*�\�
�����1%��6FUeä��֩���95T`��Sè;3��n�3k]�[zF�����!�^Ȭ���� �ú�'����H^'�<= ���wl�Z�Piߚ��8� �C�~��*�?,�~;m���m���6�ܵa�%; �  �6�pm�Zz]��ʵZwmDL����@�A��� �ZT�\ ���g��Ռ�N��>d�|؇̣	V�8���s؛<+[��3�Q�MN##��B�j
��i&,%����#66jd���c�X�RV6�a�;�4w�=����ڷ����������a�$���݈+SHo�2t�|�!�K��.Ͷx�z\Y� >���
���Uo�hN{����P�^>If�q�XJv��~tv�W5R�Eht%����t"@�����"��d���r�1���ү�U9�>�8Z]U��U�yuW�F{�	���}Z�_�}U8*�.�Bz�g�sY����*���� ��'�+x�'x��W�G���*	�Մ(l��p�q8��M��2��b��Ae ��	
�]Z��oxO���P��)���v>�]��Kc�ꅃB5�@����$J���|$�p>��д�Z����O����|S��I�#�(��h�P9�sQM�4?z�.����<�*����o;��&�꿩|�0i(������)������������o��/J�d~(�B���f0�Kd��bԘ�~�l�_��M�/	�7"�q�v��n�f>y��YN|���n�޾]�z��&��A�$��J�J!i�(��%����N}�u��!O���>��g�򃨃����{����ݞ�	�>����li~��ב��>R螣'��p�bA>��yپ��u�
�����3W��=C��E�<CQ��ng"Z|� P]<�%��!�+�<?�cj��9�B/������x�	.��߈��o���FU�Xm�A	*�֥RAd�q�v �8�i��t��:Z�ċ��|�L�]ɮ���wΫ���b�\z�qQC>i��D��6����I�ά��ɬh�`��E:o�0F�c�t>�ΫZ���|ܓ��}�<���wܛ~�«��	ٍ��]��ڀ��u�\w���D&罏�3�?	��VŢ���E����M+I�X�6N^{���%RV�ˉjy��
�ہȸ��t%�� d�T�C��OW��	�7�P��X_��yN�KŽ
��F,~:�3$*�0�S7��զs2�.%�"wt��wM�U��̪��^;AՎ,��mڕ������B�.���(:�n3Ei�z�$�ʮ�9����H��X嚐�c��#��GĽ�BM�7*nGH�*UM���.n��ش��"*�6U�q/�W�X]~!j�&�����G2Gb#v"�#DeX�dw����}�)��Bқ�zw�������Vy|�O��ƛܹ���97��.�_�b���lN*��2H�At��2�mH0H�׍ 4=�9$�}�E�Cb�琨}u	��d�k��Io�E��a�ؾ��X�]$=|��;�:���^�kd褈�٥��R�����<�l�)@I$Ԫ
�4��Sj�*Cb�ߐ��7 ?��4FG�0_���t	�{��]����w�~���dN�Ҹ�+&â�#�ّ��0�
rv�^��ّ��=��3 rs$J7��v��ɑturh�Qe ,M�;8"���P��~~	�^ҤJ �-{_Oћ�E��W���:�)Ŷ]�:��)�n�?��nM�~��H�.9'���	8��9'T���s"Q:'&��5��w��r�p]�y�l��e��y7�����<ɿ�c!P��w/�.��������&٫�      �      x�e��V��҆�{��7��ZR��h&`6!ؐI�ˁ hb,�l'�\�~�j��7������ޟ���������8�E���E�C����h����۶��á�?uC�m7.��y�'e�B6���;<����u��6k�e�:��wE9.���;<�E�m��kF��~4i���}�|9N���;(����<�Ӹ�a׭V���i�hoE�����ٚ�-��~�C�e�K��/�,��pf+���V$�f�v\�I��kw8׊�v��+v�i��G�)�,��杵��T�;���gWޏ�$-�T��ʬҊ��6�ݶ�cU�iH�2s�����1���uke�8��섅/�2u�W��x�z�h�z�5�D��|�Y�4��wakw����������:�$�Ӗ�V4+��l�̳�r���e�Y����v��BRO�Z1%3�����p�t��l����'�^Z6�E�&���[�O��g���Ys�Ç�*���UM�C�J���}6���� ��g���d׬V�}�yT1U^׹��q
�|b�;iW��Ʌd{N>΋��|���n��^F'ͦ�Lg��q����MN��Cc�L�%��2G��*��d��84�Z�Y��\�,��$�����v�����2KB�R��+`rw��	�8#�K���r7y�����SjG��e(��M�z'<��8a�BZ�Γ�2-�5��yXuߕp_���G) s�!>��٭bqe�K��i ����I��f��&�0zP��.��jo��S���*+y�A*n����}o��������	
!��&��n~4BE�CC3�Ks�*�٧}��a���*)�^�F��|ޯ�~��1�^��
��e����W�P �$��>)�Y^��wGV�G�]��}�������7�L�\]���&�GG�W ���ﮎ���\<��Ja���swdz�A������yw���\���X�s~���.�*2I�*I�xW�;���jr����|�r����r�P ��#+˳���2:��֑�����A leR�������ۙ9C�e�@�JJ�P��m�c�j)� ��>�.�R����,F��5/�
�+�2��OG��3�9��D�'9$��Jwtw��nFh&�
U �
��q	�3��������N���#+�#Q��ڀ��1:��sw�܎n���)�I�&TK&*RV������UϞr�ː��	q��<����g+g�)e�I!	N��Y��l�ߪ ��Z�KX���0$+�)tЬ_��������CZ�wFm���n�ݶ�(8�2�������k�O��M��o�c_V|o�|�?ukQo�0lmڜIux���5��.*]Bð�t�H��ݻ����V<�V "3�S��vm�:�������|��Ʋ�Y��ؐu�����Pq�.5*B� ������y�RJ^f�('c ����O�f����CJSz%<W���x�Ck�e-��(�*ʹªh�,�G���(E�JXꎍ���]�ܩ=�J��c�nmES�cs�=�^=;9��팰�IDمR��9��4�oz�+>G��hެ����F�ة�@��^��ex����ݰ��J�V^jpb�;��W}��l��)�@-�_�"1'�ܓ�Yߵ�����S�wb��6���@��
X��i�Ms��P�}�h*�J1ͳ �45��Q��@�e,�]�h�.��`#�8U������q�m�k�]'��S�E}x��h��w��T6���G����z����i��G�;|oU4NRӱ�Ѵ���1�.�Ɣe�ŰY������R�0K����s(D�Mg1��{��+$6�.�\�L�q�ݺU��y�M5��7���c�V���8G^�ru)������Ҋ�?�fۃ��h�@�4�c��(��~|�79I�Ð"�*ew�/�"�1��أ��?��H�/m1/P�mb�	��n��o}�>5+c	D�s�E�]�?������F)�X���ɮ��s0�6�fg̘X�*�T�`5��(�9"ħ������L?�T�lF<��˼���,ǻU������գs��d`bG#W�z�� x�6�+z->�w��Y��z��+qkl'T�t���n��i�um]������(�C�l��Kߵ�� ��Rt�t�	Xg)!����N-���5��E�6�)l/���S��]d��MyHc<y�! qf�<Z�� ��
Gx�\N��y��v�x&y!�ϊ��Z:���v����]�A-<��]����>���"��� ��~ȝV�,�`(��PsZ�}�k���'$R�r/@�pS��}��o�#�N�m/>�i�1�>�^˝�)E[�EEE�+��]<<��.2c5�(S��Y��m�Ջت���u��ے��,�R�F�'8�E�=�ܴ�R}�E�[p�{���~��&��U|Dǣn�����g}ϧI�A
)���3����1@]�%����6q�2<����?WSLv�&s�Χ{x�+Ev@�X�ǫ�z�s�2ϻ���lc�$b��W�	G?��ҧ~�7�W3��T8Irvn'^ �[e���.���F�@&�O������:.�b:�%��uFWdQ��$��y��jqn��UR��o��sK����R��yyY ���ĝ��x����P�i<�brē(�s�s���c,�	C�Pxj5~n|3kz{HPE�J1�!�73}���ͺ��L%���ɦ{n6y�lwU���|PЃ��c�f��f.uۮqQ�>b�B��Ůf���Ѝf���t�R��;�DKU�|����[3���Aj��3��*nx�o{*��S��0�1U/Y��">c����v��
.�|�(hfș���Rr��!j4�ء����u�V�qPW�ܨ�L2͆f7��R�x�,�TaӠaf�S�ww�����H��r�`�R7?�����A�얧��n~�_���m`�,x0'�A����y�0�6������L�77��qE�殑�������a[���4�6��j���J��k�2H�R��i\z���m��>�|�a�U�&�!Κ�y�d��� ��
�um���{���m����h]���k��Zg DŦ����'}�5����*`�h�(�r���pd����Ql�'����,�?��fݼ���Xi�m��}X��2�ٵ��4󐱤u�	s�q�����IR�3��ܘ|~�����le�0F�=�5ȫ&��>`�H� �ޚ�Anc�|{U�S��U��,i�����ﾷ4��A�d��D%���f��������1��ՠ΍���;jSc4<i"e�:��,�^򲱞;����	)q�|����
�jO��%r:�#FQ�Sw�ő�yMc`xwa@�h���U�:;x-L��iy��]d.:zI�¾d��I*���� ��W�~��pHsD�ϻ�<��ד�G�	2Q����]L�� �yؙdU���
����Y�����fz�̱���gS���~4/B��+ޔӓ�.bն��ʠ_��Ra�<!i�1|�a'����Khph.��V-��$@�A�	�%��.�_��mbPr��E-�i�F���e�Ó�xEJE��+ZC��>H/��S����ZfC�^�Ю��D^��i��[���T���������W/{����E�G���3wy_��kF���#�O�HB8�iО�.-[��ݪ{~f���sI�]�y���<�O����H��5�
 @������_S��x��5�����e����U�+4�q���4])5ʻ���wM7��a�舽����΅�K�K��m�QV����4�&��N8�����Y���o^�)�u��Dj@3��E<۰�=Pl�n��AϧhX��?��1����m�ߧ��AǬˠ<U�KV��>6j{Ӡ�JWU�ٹ�hEr��n�i(@v�׼X��B��+����)^�P���K��_跮3�v�i�s��>�r�P�ʎz�ۨ�
��r�a�5�y�A���P�����v�S��O1ϻ�ή�D���2��rOt������eے���\�"����%��> 0�<�Р���b'�n��j�M���Gjja�`�o�"��#��31��B�� /  �۞1�N-jj�'!E3���[	������.qd�iI�����X�����	R��N��Hq����7�[u����F���KI�-7��Qk������<-^%�B�&��qq� �Z�Kc�DH��/�h�GbT��y,����/���>Q�l��;7��G���E���݉�%�$�Ú�q�XlH2��j`��%�ۄ�(ĉǟ�h�?�iQ��\�uϭ#I�R��>�&E����hѬ����.!��(�Z�2��ŋ�I�0#����M�d��s���D�+�#��]6���r7|�]��b��U��P���C�5�go1�{��J�8م�J�|��[7$��;��S��B�x���,�̗�C/������4o[ZA.�x]g�I��yq^܋wK��e�o��ޕ�	�����,ԣ-�Ƿ|kE`���]��SO݁[Zu-;Zȃ���Z�����c��^�^C����7�:Y;MS�j�y\�%JQ�ҡ�<��Y^�-�Hv8�J7(�&7��x}m��$��q�QwK+�%��7d���!�`��Ub`X.��_.�� �N툦r?���kTdyc����M�<	%���%�姸`��X�+�����@/�������q�V���]���1��2]�d�n �;\[үǋ1��ч�v�q�vĮ���'��k��~X����G��m�4h&0vU�ݵ�����*���4i���A0�>�?o�}9��"��h�5\�o��]su[��:�?��]7����M��k���3N�_-I]���\i\Q�C���[bLI�J��x_�^�t�C��� b����.��L��n�"������T�!��n��o�v��5%B�%��v���"b�k��8|.��"�Р�|wc������ds���$-b�ѵ��PJ��>�ĠſѠ�Xq�,t�����x�o�����Dj�A*��ˠ���"5.�Pj1�H�����K��%���\���}^��t�M,�KLx�&�-p�/��/q
��z%ޮ�+!*u_�6�tO��폽���X�`��˧��E�ט�A��BP;�������_g>+     