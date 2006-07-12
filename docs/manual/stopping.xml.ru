<?xml version='1.0' encoding='KOI8-R' ?>
<!DOCTYPE manualpage SYSTEM "./style/manualpage.dtd">
<?xml-stylesheet type="text/xsl" href="./style/manual.ru.xsl"?>
<!-- English Revision: 421174 -->

<!--
 Licensed to the Apache Software Foundation (ASF) under one or more
 contributor license agreements.  See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 The ASF licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->


<!--***************************************************-->
<!-- Translator: Mikhail Filimonov (mvf@uniyar.ac.ru)  -->
<!-- Reviewers:                                        -->
<!--             Ivan Shvedov (ivan@tversu.ru)         -->
<!--             Arthur Reznikov (art@altair.tversu.ru)-->
<!--***************************************************-->

<manualpage metafile="stopping.xml.meta">

  <title>������� � ����������</title>

<summary>
    <p>���� �������� ������������� ������� ��������� � ����������� Apache ��
    Unix-�������� ��������. ������������� Windows NT, 2000 � XP ������� ������ ������
    <a href="platform/windows.html#winsvc">"������ Apache ��� �������"</a>,
    � ������������� Windows 9x � ME - <a href="platform/windows.html#wincons">"������
    Apache ��� ����������� ����������"</a>, ��� ��������� ���������� ��
    ���������� �������� �� ���� ����������.</p>
</summary>

<seealso><program>httpd</program></seealso>
<seealso><program>apachectl</program></seealso>

<section id="introduction"><title>��������</title>

    <p>��� ����, ����� ���������� ��� ������������� Apache, ���������� �������
    ������ ���������� ��������� <program>httpd</program>. ���������� ��� �������
    ��������� �������� �������. ��-������, �� ������ ������� ������� ���������������
    ���������, ��������� ������� unix <code>kill</code>. �������� ��������,
    ��� ��������� <program>httpd</program> � ������� ����������� ���������,
    ������ �� �� ������ �������� ������� �� ������ �� ���, ����� ������������� -
    ��� pid (������������� ��������) ������������ � ����, ���� � �������� ��������
    ���������� <directive module="mpm_common">PidFile</directive>. ���������� ���
    �������, ������� �� ������ ��������� ������������� ��������: 
    <a href="#term"><code>TERM</code></a>,
    <a href="#hup"><code>HUP</code></a>, �
    <a href="#graceful"><code>USR1</code></a> - �� �������� ����� ��������� ����.</p>

    <p>����� ��������� ������ ������������� ��������, ��� ������� ������� ��������� �������:</p>

<example>kill -TERM `cat /usr/local/apache2/logs/httpd.pid`</example>

    <p>������ ������ �������� ������� ��������� <program>httpd</program> - ���
    ������������� ����� <code>-k</code> � ��������� ������ � �����������: <code>stop</code>,
    <code>restart</code> � <code>graceful</code>, ��� ����� ������� ����.
    ��� ��������� ��������� ������ ��� ������������ ����� <program>httpd</program>,
    ������ �� ����������� ���������� ��, ��������� ������ <program>apachectl</program>,
    ������� �������� ��� ��������� ��������� <program>httpd</program>.</p>

    <p>����� ����, ��� ����� ���������� ������� �������� <code>httpd</code>, �� ������
    ������ � ��������� �������, ������:</p>

<example>tail -f /usr/local/apache2/logs/error_log</example>

    <p>������� ����������� ��������� � ��� ������� � �ޣ��� 
       �������� �������� <directive module="core">ServerRoot</directive>
       � <directive module="mpm_common">PidFile</directive> � ������������
       Apache.</p>
</section>

<section id="term"><title>����������� ���������</title>

<dl><dt>������: TERM</dt>
<dd><code>apachectl -k stop</code></dd>
</dl>

    <p>����� ��������� ������� <code>TERM</code> ��� <code>stop</code>,
    ������������ ������� �������� ���������� ���������� ��� �������� ��������.
    ��� ����� ������ ��������� ������. ����� ������������ ������� ��� ��������� ������,
    ��� ���� ��� ������� ������� ���������� ��������������, � ����� ������� ������������.</p>

</section>

<section id="graceful"><title>������ ����������</title>

<dl><dt>������: USR1</dt>
<dd><code>apachectl -k graceful</code></dd>
</dl>

    <p>��� ��������� ������� <code>USR1</code> ��� <code>graceful</code>,
    ������������ ������� <em>���������</em> �������� �������� � ���������� ������
    ����� �� ����� ��������� ������ �������� ������� (��� � ���������������� ���������,
    ���� �������� ������� ������ �� ������������). ������������ �������
    ������������ ���������������� �����, ��������� ������ log-�����
    (�����, ���������� ������ ������ �������). ����� ����, ��� �����-�� ��
    �������� ��������� ��������� ������, ������������ ������� �������� ���
    �������� ��������� ������ <em>���������</em>, �.�. � ����� �������������,
    ������� �������� ������������ ����� ������� ���������������.</p>

    <note>�� ��������� ����������, �� �������������� �������� ������� <code>USR1</code>
    ��� ������� ��� ��������� ������� �����������, �����
    �������������� ������ ������� (����� ��� <code>WINCH</code>).
    ������� <code>apachectl graceful</code> �������� ���������� ������
    �� ����� ���������.</note>

    <p>��������� ����������� ����� �������, ��� ���������� ��������� � �������,
    ������̣���� ����������� ��-������ (������-����������� ������),
    ���������� ���������� �� ���������� ����� �������� �����������.
    ����� ����, ��� ����������� ����� ���������� ���������, ������̣�����
    ���������� <directive module="mpm_common">StartServers</directive>, 
    ������������ ��������� ������: ���� ������ ���� ������� �� ����
    ������� �� ������� ���� ����� ���������� �������� ���������, �����
    ���������� ���������� <directive module="mpm_common">StartServers</directive>,
    ����� ��������� ����� ���������� �������� ���������, ������� ���������
    ���������� �� ����������. ����� ������� ������ �������� ������������ � ��������� 
    ���������� ��� ������������ �������� ��������� ����������, � ������ ���� 
    ����������, ��������� � ��������� <directive
    module="mpm_common">StartServers</directive>.</p>

    <p>������������, ������������ ������ <module>mod_status</module>,
    ����� �������� ��������, ��� ���������� ������� ��� ��������� �������
    <code>USR1</code> �� ����������. ��� ���� ������� ��� ����, ����� ���������
    ���������� �������, � ������� �������� ������ �� ����� ������������
    ����� ������� (������� ������������ ������� ����� ������� � �������,
    �.�. ��� �� �������� � ����� ������), � ����� ��� ����, ����� ���������
    ���� ���������. ��� ����� ������ ������ <em>������� ����������</em>,
    � ������� ������������ ���������� ������ ���� �������� ���������, ��� ����������� �� �� ���������.</p>

    <p>������ <code>mod_status</code> ����� ���������� ������ <code>G</code>, �����
    ���������� �� �������� ��������, ������� �ӣ �ݣ ������������ ������� � ������� ����
    ������� �� ������� � ������� �����������.</p>

    <p>� ��������� ����� ��� ������� ����������,
    ��� ��� �������� �������� ��������� ������ � ������ log-���� (�.�.
    log-����, � ������� ������������� ������ �� �����������). ��
    ���������� ��� ��������� ��������� �����, ����� ���� ��� �����
    ������ ������ <code>USR1</code>, ������ ��� ������ ���-����
    �� ������ log-������. ��������, ���� �� ���������� ��������
    �������������, ������ޣ���� ����� ����� ��������� �����, ������
    �� ����� 10 �����, ����� ������� ����� ��������� 15 �����, ������ ���
    ������ ���-���� �� ������ log-������.</p>

    <note>���� ��� ���������������� ���� �������� ������, �� �������
    ������������� ������ ������� ����������� ����������� ������ �������������
    �������� � ���������� �� ������.  � ������ ������� �����������
    �������� �������� ���������� ������������ ���� �������, ����� ���� 
    ��� �������� ���� ������. ��� ����� ������� ��������,
    ��� ��� ������ �� ����� � ��������� ���������� ���������� � ������������
    �������. ����� ����������� �����������, �� ������
    ��������� ��������� ���������������� ������ � ������� ���������
    <code>-t</code> ��������� ������ (��. �������� <program>httpd</program>).
    ������ ��� �ӣ �ݣ �� �����������, ��� ������ �������������� ���������.
    ����� ��������� ��������� ���������������� ������, ����� ��� � �� ���������,
    �� ������ ����������� ��������� <program>httpd</program>, ������ ������������������� �������������.
    ���� ������ �����������, �� <program>httpd</program> ���������� �������
    ������ � log-�����, �� �� ������ ����� �������, ������ ��� � ���� �����������
    ����������� ��� ����� ����� (��� ������ ��� � ������� ����� ���������� <program>httpd</program> ���
    ��������� ���������� � ������� �������, ����� ��). ���� ����
    ���������� �� ����� ������ ������� - ������, ������ �����,
    ���������� ������ � ���������������� �����, ������� ������ ����
    ���������� ����� ������� ������� �����������.</note>
</section>

<section id="hup"><title>����������� ����������</title>

<dl><dt>������: HUP</dt>
<dd><code>apachectl -k restart</code></dd>
</dl>

    <p>������������ ������������� �������� ������ <code>HUP</code> 
    ��� <code>restart</code> �������� ����������� ����������� 
    ���� �������� ���������, ����� ��� � ��� ��������� ������� 
    <code>TERM</code>, ������ ������������ ������� �� ��������� ������.
    �� ������������ ���������������� ����� � ��������� ������ log-�����
    (�����, ���������� ������ ������ �������). ����� �� ���������
    ����� �������� � ���������� ��������� ��������.</p>

    <p>������������, ������������ ������ <module>mod_status</module>,
    ����� �������� ��������, ��� ���������� ������� ��� ��������� �������
    <code>HUP</code> ��������� ����������.</p>

<note>���� ��� ���������������� ���� �������� ������, �� �������
������������� ������ ������� ����������� ����������� ��� ������
� ���������� �� ������. ������� �������� ����� �������� ����.
</note>
</section>

<section id="race"><title>����������: ������� � �������� ����� (race conditions)</title>

    <p>� Apache �� ������ 1.2b9 ������������ ��������� <em>�������� �����</em>,
    ����������� ��� ��������� �������� � ����������� ��� ��������
    (����� ������, �������� ����� - �������������� �� ������� ��������,
    �����������,
    ����� ���-�� ���������� � ������������ ����� ��� � ������������ �������.
    ���� �� �� ����� ���������� � ���������� �����, ������� ������� �� ���������).
    ��� ����������� � �������������, �������� "����������", "�������" ����� 
    ������������, �������� �������� ���� ��������� �����, ��� ��� ��������.
    ������ ������� �������, ��� �� ����������� � ���������� �������������
    �ӣ �ݣ ���������� ����������� ������������� �������� �����.</p>

    <p>���������� � �������������, �� ������� ������� ���������� ��������
    � �����, �������� ���������� <directive module="mpm_common">ScoreBoardFile</directive>,
    ����� ������������� ����������� ����������� �� ������ ����������.
    ��� ����� ������� ������ "bind: Address already in use"
    (����� ������� <code>HUP</code>) 
    ��� "long lost child came home!"
    (����� ������� <code>USR1</code>).  ��������� ��������� - ��������� ������,
    � �� ����� ��� ���������� ������������� ������ � ������ ����� � �������� ����������.
    ������� ����� ��������������� ������������ ������ ����������, � ���� ����� �� �������
    ������ ������� ����������. � ����� ���������� ����� ������ ��������,
    ������, � �������, ����������� ���������� �� ������� ������� ������� ����������
    �� �����. �������� ������������ � ���������  <directive 
    module="mpm_common">ScoreBoardFile</directive>, ����� ������, �� ����� ������������
    ������������ ���� ����.</p>

    <p>�� ���� ������������ ���������� ��������� �������� �����
    � ������ �������� ��������, ������� �� ������� ������� ��� ����������
    HTTP ���������� (KeepAlive). ������� ����� ����������� ����� ������
    ������ �������, �� ����� ������� ���������� �������. �����������
    ��������� ����� ������� ������ 1.2, � ������ �� �������� � ����. ������������ ���
    �� ��������, ������ ��� KeepAlive-������ ������ ������� ����� �������
    ��-�� �������� ���� � ������� �������� �������. �����������
    ������������ �����������, ��� ��� ����� �� ��������� �������� 
    ������� - �� ����� ������ ������ �������������� � �������� 20 ���
    � �������, � ������� ������� ������������� ����, �� �������
    ������ ���������� � ������ģ���� ��������.</p>
</section>

</manualpage>
