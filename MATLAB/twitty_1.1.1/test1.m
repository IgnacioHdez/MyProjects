clc
clear all
close all


% a sample structure array to store the credentials
creds = struct(...
'ConsumerKey','oeK8T5t7bPF24pa9Emvh4fE6b',...
'ConsumerSecret','mjmR00Bi5WVe1CPr7JiL9iD4JsNY5LnlZAvBEIlxa43yN47kr1',...
'AccessToken','807520039989604352-dknPFPyJmZ32onym7guz3uzMa22j0vV',...
'AccessTokenSecret','f29bLHf49zn0zmIi84vdeKqYNrykvebst0JneJ66SigdG');

% set up a Twitty object
addpath twitty_1.1.1; % Twitty
addpath parse_json; % Twitty's default json parser
addpath jsonlab; % I prefer JSONlab, however.
tw = twitty(creds); % instantiate a Twitty object

tw.jsonParser = @loadjson; % specify JSONlab as json parser

% search for English tweets that mention 'amazon' and 'hachette'
amazon = tw.search('amazon','count',100,'include_entities','true','lang','en');
hachette = tw.search('hachette','count',100,'include_entities','true','lang','en');
both = tw.search('amazon hachette','count',100,'include_entities','true','lang','en');