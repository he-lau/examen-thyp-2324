-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 19 déc. 2023 à 11:28
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `m2_omk`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('adt0tSjXN0GG5l9uzaYnAePHAylVWgK4', 1, 'projet-f', '$2y$10$PV4my3YIA7HDaDbZcG5O0uXKEFRUg6pTrGdwnIsDhTx/HpWJAAY4q', 0x7f000001, '2023-12-12 08:52:20', '2023-11-13 08:27:52');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(23, 'items', 1, 1, NULL, 'Toto\nTata\n1\n22/11/1999\nFR'),
(24, 'items', 1, 1, NULL, 'Tennis'),
(25, 'items', 1, 1, NULL, '\n\n19/12/2023\n42'),
(26, 'items', 1, 1, NULL, 'Baba\nBobo\n0\n11/11/1998\nFrance'),
(27, 'items', 1, 1, NULL, '\n\n19/12/2023\n40');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(23, NULL),
(24, NULL),
(25, NULL),
(26, NULL),
(27, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230601060113'),
('20230713101012');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('2ZdbI4J01TWygrmTxthqcM629HISv0xb', 2, '2023-11-27 12:27:22', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(228, 1, 9, 'nom', 'nom', NULL),
(229, 1, 9, 'prenom', 'prenom', NULL),
(230, 1, 9, 'genre', 'genre', NULL),
(231, 1, 9, 'pays', 'pays', NULL),
(232, 1, 9, 'dateDeNaissance', 'dateDeNaissance', NULL),
(233, 1, 9, 'title', 'title', NULL),
(234, 1, 9, 'description', 'description', NULL),
(235, 1, 9, 'classement', 'classement', NULL),
(236, 1, 9, 'dateRes', 'dateRes', NULL),
(237, 1, 9, 'pourLeSportif', 'pourLeSportif', NULL),
(238, 1, 9, 'pourEpreuve', 'pourEpreuve', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(23, 1, 119, 9, NULL, NULL, 1, '2023-12-19 10:16:28', '2023-12-19 10:16:45', 'Omeka\\Entity\\Item'),
(24, 1, 120, 10, NULL, NULL, 1, '2023-12-19 10:17:51', '2023-12-19 10:20:35', 'Omeka\\Entity\\Item'),
(25, 1, 121, 11, NULL, NULL, 1, '2023-12-19 10:21:36', '2023-12-19 10:21:36', 'Omeka\\Entity\\Item'),
(26, 1, 119, 9, NULL, NULL, 1, '2023-12-19 10:22:17', '2023-12-19 10:22:17', 'Omeka\\Entity\\Item'),
(27, 1, 121, 11, NULL, NULL, 1, '2023-12-19 10:23:06', '2023-12-19 10:23:06', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(119, 1, 9, 'sportif', 'sportif', NULL),
(120, 1, 9, 'epreuve', 'epreuve', NULL),
(121, 1, 9, 'resultat', 'resultat', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(9, 1, 119, NULL, NULL, 'Sportif'),
(10, 1, 120, NULL, NULL, 'Epreuve'),
(11, 1, 121, NULL, NULL, 'Resultat');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(43, 9, 228, NULL, NULL, 1, NULL, 0, 0, NULL),
(44, 9, 229, NULL, NULL, 2, NULL, 0, 0, NULL),
(45, 9, 230, NULL, NULL, 3, NULL, 0, 0, NULL),
(46, 9, 232, NULL, NULL, 4, NULL, 0, 0, NULL),
(47, 9, 231, NULL, NULL, 5, NULL, 0, 0, NULL),
(48, 10, 233, NULL, NULL, 1, NULL, 0, 0, NULL),
(49, 10, 234, NULL, NULL, 2, NULL, 0, 0, NULL),
(50, 11, 238, NULL, NULL, 1, NULL, 0, 0, NULL),
(51, 11, 237, NULL, NULL, 2, NULL, 0, 0, NULL),
(52, 11, 236, NULL, NULL, 3, NULL, 0, 0, NULL),
(53, 11, 235, NULL, NULL, 4, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0b4425oi60fu84r7bb9akm4f5n', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313039313030392e3633353538343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223463727164653667746e3571717466353565396b66726e713333223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039333237383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039343538353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223835646438316363666162643535353439313430643264653739393632653866223b733a33323a226661653364316439653364323430393166336464316438333964646333643130223b7d733a343a2268617368223b733a36353a2266616533643164396533643234303931663364643164383339646463336431302d3835646438316363666162643535353439313430643264653739393632653866223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a323b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223034373064306537623961663137313232326433376562653263393163316435223b733a33323a223931353162343431313965303934656234376136653866356661376666353535223b733a33323a223639336631316636316430326639376566353132373938366636346637633935223b733a33323a223839333864353735303830663734333439326138363738613533663233343031223b7d733a343a2268617368223b733a36353a2238393338643537353038306637343334393261383637386135336632333430312d3639336631316636316430326639376566353132373938366636346637633935223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701091010),
('7gnn3m2sj2gc3p3uc607njroqn', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730323938313430372e3838383936373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223462696f71633864756f6f3267616e383970326a396c666d7036223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938323238373b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938343039363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938343138303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938353030383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730323938343934333b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226632656564346364333637363761616639326335303461356533396461303962223b733a33323a223130646132313630353166353762613066613635653134363234623932633965223b7d733a343a2268617368223b733a36353a2231306461323136303531663537626130666136356531343632346239326339652d6632656564346364333637363761616639326335303461356533396461303962223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223835376663656633373565643531333836386564363230626165623639626237223b733a33323a226431323063363662323365656662393639623366333034383965663937346264223b733a33323a226635353530333135386539336535333562663836313734323732363938343965223b733a33323a223462386538316565343931346132303465356462343838623936326633616435223b733a33323a226564343663353535303565636638316231383362663732373239616437396338223b733a33323a223332396434366530633234356363326132383131653030393734623330323630223b733a33323a223261343230326535343636373035353030633462653836636333386137623162223b733a33323a223030313163386164626332373035363262313534653035613132353839666565223b733a33323a223565303437656637613036393565313133373931383339356138643534343534223b733a33323a223366323639383265396136343362626431656333343430333935613566343434223b733a33323a223265623530663233343830656632386339613465613361643632373463303064223b733a33323a223365373537636433346238646661623331346365383935333266393762653464223b733a33323a226238613766613630343564353832633961656236663863663662383563336331223b733a33323a223436323932376131366666336634383631313536653738313766316161333236223b733a33323a226139653862346635366331363461616266633133323161636164373631613364223b733a33323a226435653932346530323366306162373562373030616237623733343666643533223b733a33323a223838343765613634653861323539393939613963303934353033623264666264223b733a33323a223063366631386262643565303163646262353762383035626164366265643763223b733a33323a226335636539306135353761623363333834643866346565643738376637303363223b733a33323a223334373931643938393931373361316438323038656264373732323533653634223b733a33323a223530313863346339333861333637336333623163303364303431656263326130223b733a33323a223361343434633633386638366236393464633637316365636332623836363931223b733a33323a223462626232626135346165383661326630646364303364386261623234313733223b733a33323a226165663037363336393564633038313631626166356131313739653463323635223b733a33323a226338643762643635323862346464616331336438666134323761323562313139223b733a33323a223830633535356630313834616463343739366433353465323635393362316537223b733a33323a223163626461623838323032656331356662326234633765343732373462333062223b733a33323a223738303263343035613532356632623061323261356430353936643832653232223b733a33323a223433333062393730633937643637666565383731653438663236396661666437223b733a33323a223663363739313532396631663039353737326539356635346464303163303631223b733a33323a223963336537643230363334633731613639653563626638353961313565666662223b733a33323a223032386166333537666636363534626364633238303535313761343266353437223b733a33323a226635373231646133643664383566303636626138393337366363643261303437223b733a33323a226366373231376133303235623733313961613761343163396265333662373230223b733a33323a223239303461643664323033336261313031656136616231623462383734323739223b733a33323a226333646539326163646263373537383831383038653234326465623035663232223b733a33323a223162623831633066633564663030626131323139363639366236303937303333223b733a33323a223139356331313432616361303863376534363535643632336538343735653432223b733a33323a226632663339383335646566633566383036616533613435326535633132333764223b733a33323a226561336636623837626430353763373232306365613663663431633861356235223b7d733a343a2268617368223b733a36353a2265613366366238376264303537633732323063656136636634316338613562352d6632663339383335646566633566383036616533613435326535633132333764223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223763666136643361303134346337376138343663323631636365376539383638223b733a33323a226133636634623432306637336666353635326434346530383163343066336633223b733a33323a223039333239323564666665326562353730626536336336393861303663346232223b733a33323a223835363339393330346438356663356637656635386637356139313638613365223b733a33323a223431366238626165393266643135633333366534326362636239353662616233223b733a33323a223336303161666134646265663234373739313632663832316563636331643238223b733a33323a223766386663633438623763336265363833333333313163663065386235353163223b733a33323a223066366437626335663164303039376463323633663538613134306364616461223b733a33323a223639396661353637303136656537316135663530663435356339626264643839223b733a33323a223835613664613035653430393164303365323763363936366539333934663333223b733a33323a223061386635633463333931626135633234393239613436643263313563663362223b733a33323a223335613631346565323465623038626661626537343537623264323534656235223b733a33323a223038613033356132633839303166363464326438356136353764646435646232223b733a33323a226464316162326435336435396531343239396433646538323265363865393739223b733a33323a223739323733663261386537363962613839333636633136383731326639656639223b733a33323a226461303933356135353633303431336338343466366361323436343232626238223b733a33323a223333666133663662356239323534633839366535383032656161623363306530223b733a33323a223263366633333165653735646463653738396634356561623134373362636465223b7d733a343a2268617368223b733a36353a2232633666333331656537356464636537383966343565616231343733626364652d3333666133663662356239323534633839366535383032656161623363306530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3131303a7b733a33323a226662643331386665616634643563346130616639323564376366623964326636223b733a33323a226231633536643137396137383536346561323265653963623934636234386264223b733a33323a223637643338653463396332613533353033656136656230663966353131633839223b733a33323a223866353761656564303636663061396335326162353962366134343534353436223b733a33323a223063623964333834636161623932356336643839636535366632653835623264223b733a33323a223437383037303132653566636337303930383530376234393365336166303037223b733a33323a223465363831376263303734373934313565373139343736366431633436616531223b733a33323a223038613538363763613831363263356161336439363864306563616331613430223b733a33323a226533383865333838626232343362326634396539633662633661666561383834223b733a33323a223662356664646236373561366662313531363836636666613639366266313137223b733a33323a223036343335653661623261356166303734366633303361363736656461303866223b733a33323a226639386230386232626231636431653133313236383434373532373039366338223b733a33323a226161376536616137316537353133373239353663643538343131343531636534223b733a33323a226665343865343834313566303662623433363865313064333562643035666431223b733a33323a223132666161613164633066343362656535383239633536653531666233633065223b733a33323a223134356464363261633466353439323035323435396264326232343263663634223b733a33323a223330636164366334353239623730393133353131626632643035313032646164223b733a33323a223164653763323961393361663964633736386162346132363231323935323034223b733a33323a223363393930383639333563633534636665353764333761613865636530373032223b733a33323a223861393239616135376664363061343361396532306661376235666130363934223b733a33323a226634343232303932343839363366376564623465646634626239666263363432223b733a33323a223837366566343035613730383738323237623838323539383361316631613337223b733a33323a223139333662323562653734326636396138303438666138306230373236646462223b733a33323a223063643535636361383264373339636164323933633732326532396332313432223b733a33323a226466333139616661653465376535663539666635343737313462663961663530223b733a33323a226538393933386264616361386633386531633732613639643431336632623965223b733a33323a226264633936326165303538306336613761386232383261646135313166663365223b733a33323a226334343366383931666234653036353361373336383862373161386330336362223b733a33323a223139663266366330353037666261653235326330663366613430653430663038223b733a33323a223431333831656234353965333432386261666536346231396335663639376564223b733a33323a223665613238373539316664383832633136366533393335396263313230636666223b733a33323a223930633333636633323166393364393762383830653961633133633231303531223b733a33323a223465623334383237646538623466613937343532633133386433376232656134223b733a33323a223236623363663837623065343362363766303966353461323630376439363665223b733a33323a226535643765316635376563363138636535353831633066393138363536653763223b733a33323a226666306633333831336236393036643539313731386661656464363638373139223b733a33323a223261333832653663383539393632396362333535383535333462653236306431223b733a33323a226564633532643737373834346666303537666333306665616636616364353736223b733a33323a226636313264393161386630363939363132653665333561373062653132346663223b733a33323a226264373038366133323361623065633339646561306464386535343563343863223b733a33323a226630313162356334653531666261303962633932643264656466626537323563223b733a33323a223265316532653063393935366231383564303562316161633031323561653432223b733a33323a223337383035303230316533343431323264636161353965633738306636613565223b733a33323a223466383266376438363231393439336332666666323863376461613963663065223b733a33323a226537396664356331346331326139363330376435376531333930363637623739223b733a33323a223262383433373366393239383261663263373139353230303832633363393964223b733a33323a226236386435383737623266316437653666633463363264303562656136313863223b733a33323a223737346531663237656330363735663062636665613338383761393939306131223b733a33323a226662313334303965636433323235393237353937393961383237396238323235223b733a33323a223865303762313663633931623438346566313363373264666637616535633463223b733a33323a223261653435343539316131386265303437353930383433366330353531373464223b733a33323a226631623066316363633266666237636634383962353530323333343330623932223b733a33323a223630613132313730643861643566643533396239336237336133356463353630223b733a33323a223366616361656366616362613435626366363739323932653530353066343733223b733a33323a226564303239333133396664643432316163343330326266616131333461643934223b733a33323a226637613535363935333534663231643933346333666661336437353863366235223b733a33323a223232356631373131326132323135336465373761326163613137613336393834223b733a33323a223536646635343431616633356261656432323235653235393832323362646236223b733a33323a223533613930383438663838613135326530306166626462666662643465383563223b733a33323a223834666561303837336534313063633732376134303337353132633438363631223b733a33323a226233656263346364356237633664623731303732623337336261353130356362223b733a33323a223032366439393566303637353733303832383865363035383939393965666632223b733a33323a223037363536303530613461343634363666346233396132633262306539653266223b733a33323a223864383732663432373830316134336464333039366330636436623563636432223b733a33323a223135636537316634623230373465303966353331303436393836653437643039223b733a33323a226437376534306463656432336137373764353838376137626436633936343433223b733a33323a226362383833396331613134383839626534383462386532343965656330636433223b733a33323a223839646133356430333232663134323366306430346264376630313466363031223b733a33323a223665343033353966323539643633363065663435663164623963633864303934223b733a33323a223961363835653339393561623833306561643866613434383762626363633437223b733a33323a223130356135633533636666653463646532346634333434333438643732623630223b733a33323a223732393063343437326136396463306131363737343564623137633439653261223b733a33323a223832393561356633656637353964646566306531313035323466613531356561223b733a33323a223230653763363930333732366565623932653638383061343737303062316433223b733a33323a226335643230373136363365613062663637353337383562626563323133336561223b733a33323a223531383930653930393930343638613939333833366139623930343831633961223b733a33323a226639366239326464356335366165666333323637366539386130663962396262223b733a33323a223936646237366161656166663232363232633262386433323066343137363531223b733a33323a223630393139363333623261363630616563343238386334623733383634636633223b733a33323a223863356431336336323834666334373936386432653737656137343438633863223b733a33323a226335396437656337616635393730656364663761636633336266313639663564223b733a33323a223863353739383736623661386233386232653134306535346435383436663831223b733a33323a223238396437313939346665303839373065343333376530313165303536653165223b733a33323a226432306238616265326233303663343037343162333631626438333963303033223b733a33323a226534353531626334306333303364623434303263626361313834396239383239223b733a33323a226666393465646635623935653036386265346164346139373238313232383138223b733a33323a226635666233643433373039373131643730313333666162393539356661353334223b733a33323a223837366630633766303731373238643462636361623030306261633139306164223b733a33323a226237613431393664303839333566376464316366636636663066626332393466223b733a33323a226536303832636430653064633437636536393632386535313338366165316662223b733a33323a223037356233623831666430343339363536656237336537316332326233653130223b733a33323a223036623133643434363166383934643166396636653637343663643533643238223b733a33323a223266353361616134383133313934373832376466363039303130343634636335223b733a33323a223664653861316139376666643262333965323162636439303561393734653366223b733a33323a223037343138633537663033643431643938316538393166326138666338326238223b733a33323a226431376534393532653235363565323166323238343562623966316465646130223b733a33323a223636323165373765643061363133326366613331633463666162393633386666223b733a33323a226263373530643362313835633764656266633835336534373431643461353634223b733a33323a223034633830643362386635373536383035383465363234666464316531363365223b733a33323a223664383134373561393239656339383061303366343861363766366337323661223b733a33323a223035386363396430663961646337316466343030336662653965366439636130223b733a33323a226231373139303466633138646165353365303964393434636162363165626266223b733a33323a226238313863336330303632343431386430626336636631643832313630323561223b733a33323a226234326565396338653433323534646332383430353539356631396461316466223b733a33323a223037363138306136393936613036363630353231316132623637386363663537223b733a33323a226166633261333431656136356564613630313663633763363266656666326164223b733a33323a223632313834656331396536396232366263633865663361326338353832333832223b733a33323a223062396633626230613234626136656461663362316435366263336634346430223b733a33323a226339333733316134303263376136323161383264326233376232646666323433223b733a33323a223565356430376639333263643066666461623664336335663266373961303331223b733a33323a223864393865663830313465316430646239323639333332353366633663633436223b733a33323a223765643235346131316132303039383765656133346636383863363936356130223b733a33323a223265383930653361326262613964306333633166303832323364626132653434223b733a33323a223738623737386663313634323635613062306632643761373535666434356339223b733a33323a223833663232366164666136343963643661646532653163653562643361346233223b733a33323a226563646365613530303761333632366435323636323764656265373736383561223b733a33323a223434396539333765356239386630613537373933373330336233336264353962223b733a33323a223265326331313636313664313066626230656161646261393535613862346635223b733a33323a223033633537343764323436623766316330303535663834653366636130313330223b733a33323a226536366366346366663165353138386534333338656337353366356537643430223b733a33323a226537316563383032326635663034326461356663653033633239396336626636223b733a33323a223138323236623564336561626532396133303936393138326330373461626362223b733a33323a226334333864663964613537366665363035366333366366326562623836613035223b733a33323a226132663338366139333435326261353833313636356461316239636466376262223b733a33323a226639393137316431396431316234363233613665653930373033663336386133223b733a33323a226430383566313638363432366437383530336266393139306462333134373435223b733a33323a223537333633363432663734323638383633333264636665363935343537383430223b733a33323a226365666134626335613061323834383338356133313433373133656635633532223b733a33323a223439633133376330613862323362336239363832316162306236396362643163223b733a33323a223038613538313633323439316361666663333461636230323864623932623830223b733a33323a226634313366653365633236623765626332636264396138323030313462663731223b733a33323a223531656665666239626531653330343364623339633037613031343862656138223b733a33323a223062366139623661666563396531326539366337383139313232623231303434223b733a33323a223237383163346433313766633564313930376531363937313636303362306435223b733a33323a226333663731616333623539636330383435663963373237306134613735353231223b733a33323a223763623765376437633738653661313733323331396161303238393561343966223b733a33323a223063343862383662363363633533626162666566383766663336653037653431223b733a33323a223736336136323161633334613666643165626562656130643235636364353936223b733a33323a226231343938353165666134626663373830636339666166393832356431656139223b733a33323a223566616366366637666539613563613662363464666166356439343730393938223b733a33323a223934646337376437353164386639343061383437356532383737613631356632223b733a33323a223162636330343436383235366437616630346165303662653633303662663961223b733a33323a223433373766613234376366383831646464396161326432396361396131333565223b733a33323a226330363635613336363635313634353137653266376437613239383034653830223b733a33323a226630633136346638613965346232373631626566626535363833393164646333223b733a33323a223935663463363065633332363563343762326465396163363763373935326230223b733a33323a223633313262326536633731653665353233613738356563633461346133343231223b733a33323a223131396339656133383935316336306130383430396538373062323361623536223b733a33323a223835323137356164663036303430323035326232636663626464373263313737223b733a33323a223931323966636633323461623238316535616434653863356461656266363634223b733a33323a223338373235353864363766666431333332376561363636326664663738616436223b733a33323a226562633935613235326334626436373937366665623063663530326132373931223b733a33323a226363323030376231616233373561373638306631666362656130653736623939223b733a33323a223930666434386438366339386231376564343464663538323133633431643661223b733a33323a223433303764366362333231373938646130396235386638653065343363663733223b733a33323a226365333934353562643632323166633566323666623563626666363763643435223b733a33323a223063313466336565633966316538323965316466653639326432636332623663223b733a33323a223061323238626533303764333537643234653534376233333364313231376632223b733a33323a226433393136633264616166333331633330376462386538376432353766643334223b733a33323a223461383636646661343963306164643364626632356162636639653763383764223b733a33323a223337313664313234623465633061633630333130353738366231303435353566223b733a33323a226261393235383834653730663630326266363865346637313761623665666462223b733a33323a226464383939393733356135343433633538346161373466656264643866366464223b733a33323a223732333461323937356535373963343266613530373635656266373839313865223b733a33323a226434306134333034323365303431633734623236626334383939613764346537223b733a33323a226135623164383161626436373764343066623464386139343536623939323764223b733a33323a223935393838303338316635323466663065383333633232626537656430373236223b733a33323a223162333733326166666532613330663639306137623566646532326637383633223b733a33323a223632613064366130623734663438633939353238303563626432373464383965223b733a33323a223662356631353131616531313162623238666131643461393761616533363632223b733a33323a223030323566373137356562663838386537326565613437363864346136346464223b733a33323a223033373363623039636438653562623663643832613236653963663437313862223b733a33323a226435393063393131356439633464623138626136363563343737663866343561223b733a33323a223036393835666436393535313862303330366331346534333962393735393438223b733a33323a226161343262333438373030386435636139653161303332303334623933663265223b733a33323a223038306238623265666134366133623732616336636238313762653033643039223b733a33323a223437323233386636356436393865666130326230363264383062386530366166223b733a33323a226630636330353630303865653833666130623335346561636265356230376436223b733a33323a226337626365663064306639396335613632363336393265623738616239333334223b733a33323a226130346264336339373765326636363830666330363037653961323836363336223b733a33323a226261666462303965613266646634663566333631363136393866393064346432223b733a33323a226636626661333163373563363032666531333764326338613334643562333762223b733a33323a223861356464323039646362656161383062656661343062353366373963626432223b733a33323a223262373862326533303930666665643261363064373861306462653061396362223b733a33323a223562613561626665376531643739323963316664613966613035333530633835223b733a33323a226535626633346338666263303835316432353239616632626562396132663630223b733a33323a223534636533363763666432373434356262393735336634623432346566363863223b733a33323a226339353834663631333336353933346436306231613737323462363036333330223b733a33323a226261376161366531306639636533313266303335313666333361643637363831223b733a33323a226463323136363235623331316333356138373533666237386233623535393564223b733a33323a226437663337376430643864373136653838326561353234343535336434646165223b733a33323a226565623461313536366131383762343738363738633737323339336235633333223b733a33323a223436376136313235393134343262343663333437393533333035313134343630223b733a33323a223731393336313334326631343963663430613139316136306439326265636230223b733a33323a226364303263333132656438616638303363613530343937623761636363376363223b733a33323a226635346132656162623033306231633464316635366261363365373663393536223b733a33323a223634626364636664613361343763653135333438353432346436386539653166223b733a33323a226162663161323534633736666635383037313565383831366463653737303563223b733a33323a223031303832666632633964636466336439633532333062313035376561626233223b733a33323a223163633462373830383363646231616361636162336366633930306563316564223b733a33323a223439376162303337643231653631653939383438653864643635363832626563223b733a33323a223532343363366239363537383966366462386430313365616366333339623739223b733a33323a223739326638383934363761656165643364396237353930336338326533346638223b733a33323a226564643530363663666263626436346365653161613439616466373338383336223b733a33323a223161323634653465363030393336616433393761303862383565316638353136223b733a33323a223039633066333030616431663931316639646265316532623337393536393736223b733a33323a223439613865356261313339376462643130353564386165656631326439313530223b733a33323a223233333663326162616335313663303938303163336664323537626666663036223b733a33323a226434636537366633643831396562343362663164656466313535316231616430223b733a33323a223638346166333237633333643030326634623134373436343063366136626336223b733a33323a223233333339366261363661666331623838306433626233633435376465323463223b733a33323a223335353738336534373965653965626236333634313333356132636365343337223b733a33323a226637373133633165303361646561613635646366316333373136326263333364223b733a33323a223931633863353331613562346462386630393533663337646430623562646666223b733a33323a223865376163396232303330663736316238306561333438373264303262343965223b733a33323a223365666161376266343338633632636537323662616366663766633062643934223b733a33323a223264303961653362393864316163663361616432356264336238373432393264223b733a33323a226336316637346133383263376135653530633033376139633035343835333563223b733a33323a226363306230343565356537323538376139643132306463633836636433363536223b733a33323a226462653264313832323034383134663830656265646565656361376632653861223b7d733a343a2268617368223b733a36353a2264626532643138323230343831346638306562656465656563613766326538612d6363306230343565356537323538376139643132306463633836636433363536223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31313a7b733a33323a226537326139386562656535636562643363343764633530353462373936363734223b733a33323a223566343764613734353833303533636438336363303733313265336337353438223b733a33323a223765646436306234343962656532666565326530373733333034323265343131223b733a33323a223734336664303539366363386438366533623230633132303538316432633130223b733a33323a223534616466343562303739326237303039343666353133363936336161353337223b733a33323a223937376365656562326631643963383934393166353137323363313734306532223b733a33323a223638663565613039623632323339373736333165316635623337336363666434223b733a33323a223932396661616265323938333763373332303063656462633961323562643563223b733a33323a223935306462383133323265663666366133336461633930396566393135316437223b733a33323a226361663464653433613765333933383731323137353632613133383838393734223b733a33323a223537333034336632373930373031613433353833356662626231663132323161223b733a33323a223230396631633263383362383964613863316431396465336434326236623834223b733a33323a223831323332323433326165613933663439626436653539643935663539636137223b733a33323a223435333431636531343961353436393538313766373833353933656439316362223b733a33323a226166303830333366343565366363343236313930336136343931383364643138223b733a33323a223937316635633933663035313861643333336132333464636235366334393231223b733a33323a223739346262633166316363393730306134363834326430616336613034626461223b733a33323a223561623138373531343933333432336236326539303031633437616266306263223b733a33323a223235346533356431613839653738616633663462366463623266383637646438223b733a33323a223538313632373136336331623764333339323535636266663861356531306663223b733a33323a226237343238343933353437313538386130353665306565336661656130666132223b733a33323a223062656438356336323430353437313330303031333134373234353536616234223b7d733a343a2268617368223b733a36353a2230626564383563363234303534373133303030313331343732343535366162342d6237343238343933353437313538386130353665306565336661656130666132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1702981408),
('7uthvhb5bh0ntenjdea6p0gc6u', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730323937383638362e3835313837343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273713276646a6672686d703031676b676a7365756a6438763439223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938313535313b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323938323238323b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226537623736626663336530663830343233346263343265633565313334653433223b733a33323a223465343339326330636536653635623638343738653262653662653066663134223b7d733a343a2268617368223b733a36353a2234653433393263306365366536356236383437386532626536626530666631342d6537623736626663336530663830343233346263343265633565313334653433223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223061336436653134303437386336636431313762353233636266626538303436223b733a33323a223362306561336337663532623365356437303033623038383965643061346637223b733a33323a223737613132363231353064323065623333633732303566616566633365383663223b733a33323a223737663363373732316262366566643837656339373137353262643066613764223b733a33323a226566376266396163373839326437373766303536323730313333613831646161223b733a33323a226666306365383333303833326431336366613139356139386265616334303335223b733a33323a223664336436393539396263376435343462303035643664623932303234356265223b733a33323a223331626433356364373463346166373464373063616364353062343330666138223b733a33323a226464303230346137623432366362303931363632313764643436666439363161223b733a33323a223730343562353933363638653063623139336463393466343634666336303738223b733a33323a223466393437333035366666383764323437303433313366316565343035653966223b733a33323a226632356239313939323739356333616533623136376165633933663863633532223b733a33323a223430336266663039613362383063343137393635313234643133626432376264223b733a33323a223337306433326262656161383864623038343232303638383232653961303565223b733a33323a223732643833326565623231376635313737326361376138353964303066623664223b733a33323a226233383734323237346361393462643234373031366532336632663736316162223b733a33323a226232656165663339386630366330303537613230303431343339623739396664223b733a33323a223637343565303436623937373965366537616432393733616639323964656334223b733a33323a223531636433393037373961376432613836373534623262636634366562353766223b733a33323a226461663165336230653233306165316639613634393865326166333764323530223b733a33323a226431353338613735336366646266633834323833356337326133383365636561223b733a33323a223266633335376633303634373633343235383137313666623866623562376132223b733a33323a223338643063656265663264393337316261323965353434386137643130393861223b733a33323a223237396632346633373664616462356666303937373338376131323130613865223b7d733a343a2268617368223b733a36353a2232373966323466333736646164623566663039373733383761313231306138652d3338643063656265663264393337316261323965353434386137643130393861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1702978686),
('cidsq368ilr9vethvl37aueos5', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639383532333931362e30313832353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227167346272616b61336464763039616435306770397333643375223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383532343832313b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383532373531363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383532373439303b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223336356662353338346264383762343636333863653962666438643266336539223b733a33323a223138366664663262376430363234643138353865663731333537656638343430223b7d733a343a2268617368223b733a36353a2231383666646632623764303632346431383538656637313335376566383434302d3336356662353338346264383762343636333863653962666438643266336539223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33303a7b733a33323a223832613731616438326663613434616134356338363733386339643961653335223b733a33323a223031346137343533376164383635336136356237343431626665633762623532223b733a33323a226239636638396536653738356532386230643137343165623139383233373531223b733a33323a223434643030616634393330623630623066316337343461623737613537343632223b733a33323a226338336562346632383461643337643236363762643236383066613239623935223b733a33323a223136396438326363663630623466623130333039333532616634376337396433223b733a33323a223839303032306133353139316366393033343137396231383134623936386130223b733a33323a226333653237623634613636646238353831333866306630653635613031373533223b733a33323a223132656638633832626566663865323839663361656461356437343862653632223b733a33323a223566663064396536326561393633363635393862306263633763303634396239223b733a33323a223162393066366134343532373930323964633638613863366637626238383637223b733a33323a223637626562303165643338373232623934646432393563636231363434633536223b733a33323a223165396330343232323363646563643230396639633264656634633462663930223b733a33323a226636386163633130386639323433613563323338313862336666623936613766223b733a33323a223663346238316538323065393733623663333735383033336638633839663332223b733a33323a223465323536653765316232303966646338623930333762306331323733653337223b733a33323a226531646461356134303663333339386531393837663334623564303939643438223b733a33323a226534396135316132666538623036383536643231663230313263383436626266223b733a33323a226563386565656465356437313232383734306334613233383465643662363664223b733a33323a223863666564323135613633336562343633633739326161393661643063336235223b733a33323a226265393434643037356333346134383035663366336637373665356166636632223b733a33323a223364396235323163363834656237383530333137383761656134346336633237223b733a33323a226332393437363530336537653262396234393463656330343734383362643230223b733a33323a226563303362653931623935363130313465346361633831356431646437323630223b733a33323a226337336537613965326235326237363536623631323664303636663936626234223b733a33323a223237366564353730616433643263393637373537336635373162353938633961223b733a33323a226464363166386232633231373139343432313761626362656438626363336161223b733a33323a223539306166363362656264336438323766633038626566393333326562636434223b733a33323a223332333833313535643039323464313465323538653039386263633338653030223b733a33323a226163343864383439313135306361323632363632643832613731353636326439223b733a33323a223232376661373636653831613162316462656634623765633764306365626332223b733a33323a226366373432333933333430303861383264663338646234633061623934363562223b733a33323a223839333537326236396462393565386665653262633236636561346233386463223b733a33323a226363636130366432646137613731343232633736363635633935623637363830223b733a33323a226266653464356165613466646631393963376136346633363565313761346638223b733a33323a223437333831373463343963306464666461356365393233386337386330343764223b733a33323a223434393432633464353232326236623536326235323236383061623138313963223b733a33323a223565623234643932363239313365356532646137383365646630323037343533223b733a33323a223366643532633838613136393634656463303539306261666639306164313331223b733a33323a226461663861313465316561663039616562363238626239356139616233316630223b733a33323a226435616137376537386536613264626661616566336536306537643562383838223b733a33323a223936633162363065643664663737346136316334383263633033613532316563223b733a33323a226365343736343066646566353934653934333864363463356235316261393536223b733a33323a223536623561313336323332306562613836383564623431623938656637313830223b733a33323a223731333739663137353237353933383331326362366139313861646530643335223b733a33323a223734616262383032316630316164663234313564363231663738653132623163223b733a33323a223163326562663765306332643963386138666665666264306635656132663366223b733a33323a226462653362303364633431616539376163646237366465313134393361663862223b733a33323a223163306532333136303137613664316134613738353434663061303330383631223b733a33323a223431666239643335393631353562376161393063346162653866313933666664223b733a33323a223561363766306364653537666163353736376462373565326530306264383431223b733a33323a223462646564643331383036666137336666633931306437383466633930346466223b733a33323a223532326334383461363537363136383732346564393631356331363431653663223b733a33323a223130623437366436356562633361366565376639396537383263366631613365223b733a33323a223038653134636261356533623065396433333538646333346261613134333761223b733a33323a223965366633363036303666316639373334363338376237303830303234313361223b733a33323a223136393063353263363831643862373736356139646463636636333535626233223b733a33323a223132653461366166646135663939343566393630646539633038663430333830223b733a33323a223831336463393131626233363739636231343439313335313734373235373064223b733a33323a226664316665356433313737656262663137643962353639613035366435353439223b7d733a343a2268617368223b733a36353a2266643166653564333137376562626631376439623536396130353664353534392d3831336463393131626233363739636231343439313335313734373235373064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223564326635353138643536333431653265363732636261613437393935313566223b733a33323a223966616661646163323136633432643962353937343438656339373937656631223b733a33323a226365353032613037393866663366663931383936396433303263646637386662223b733a33323a226538643565376132303161623033616533666661393335333036663163366563223b733a33323a226635383666666238633539363838363436613532336234623164396132656266223b733a33323a226433646335646339396336366634613433393630666535323136386262663837223b7d733a343a2268617368223b733a36353a2264336463356463393963363666346134333936306665353231363862626638372d6635383666666238633539363838363436613532336234623164396132656266223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1698523916),
('ddr3jbni51656m0ih7jqq9k8a2', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313038373839342e3930393930343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22646472336a626e6935313635366d306968376a7171396b386132223b7d7d, 1701087900);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('f1rjop9t7iiqp32tctph4vp747', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730323337313137342e3531323730383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e356461346c316c726c66356c6134616f3635616c3431387575223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323337343731373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730323337343736303b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226663373630396662343839326563663937623265346166376638343033353766223b733a33323a223537363664396165353439633138376561303366393733663131653464643064223b733a33323a226664653166333661646539323430373164383735316132356233656163336635223b733a33323a223063623433336162616361666465623738656337393235633463383962336232223b7d733a343a2268617368223b733a36353a2230636234333361626163616664656237386563373932356334633839623362322d6664653166333661646539323430373164383735316132356233656163336635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223461373764386536393838636538323033313238666361653239666163633435223b733a33323a223238346362373037356134383531323665613031333939353531616565343164223b733a33323a223831363963636665393036633430333066303233336431353534386239663230223b733a33323a223233353266316533353437353838653361333238303138643065396433383238223b733a33323a223164353465323063343535323136343230626366343661316466383865326462223b733a33323a223333646632643236373165303032316438383435303435663431326336353164223b733a33323a226236666231623366613934616233383939333535313730336334616437643865223b733a33323a226464666565306262313533393131623031333935363361373361623135346130223b733a33323a223033343236656433356462373432346331313561343239373136613534396138223b733a33323a223831386130636262303835353266643564313264663732323364636539363961223b733a33323a223738646261386333666465373835333136336666383662653231323230643865223b733a33323a226139353534616532623262343066343561616333366235333938623133306161223b7d733a343a2268617368223b733a36353a2261393535346165326232623430663435616163333662353339386231333061612d3738646261386333666465373835333136336666383662653231323230643865223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1702371174),
('fk6tvt894j5v1bijluevqm92gt', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639383430343835312e3135303337323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226173613433323661666a676f737575757634336a646168706131223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383430323537353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313639383430333037353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383430333037353b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223832666235366261643962383963666363323237376161616237386363616637223b733a33323a223838336437313639306566353234366362303061613738386366396139616361223b7d733a343a2268617368223b733a36353a2238383364373136393065663532343663623030616137383863663961396163612d3832666235366261643962383963666363323237376161616237386363616637223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223935623236353533343035613435633563373262393331613732666662653637223b733a33323a223239356364323432623666613134336639373834313366363534656333303838223b733a33323a223261663565313465303561383138343362633430643432666235616165306463223b733a33323a223531623738646264383165346139316135653238383037336261336536313733223b733a33323a223064383436653333333664346264333465656338376538636132376133326333223b733a33323a226130376330393838313336363330306665326533383065303139396235653662223b7d733a343a2268617368223b733a36353a2261303763303938383133363633303066653265333830653031393962356536622d3064383436653333333664346264333465656338376538636132376133326333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223264313738653261353137323338323538623632623034346261373231356530223b733a33323a223937356633316137336532656662616633663063366166626535393562363338223b733a33323a223734633233323936633138313964323361303037306436656166353632366235223b733a33323a226137613331333935303833333737323730373230353834653265393737306130223b733a33323a223838643133643639353538303332383632653863346339376630633265313962223b733a33323a223235353866396338326666373136343931663766326636376232393465313364223b733a33323a226334333436333736396238613361653330316363316430626165383437356438223b733a33323a223334656563303065626662336233373335313863613963333837643564333430223b733a33323a226234643639343666376361646665366234616137613463306261323938333038223b733a33323a226239646562353565646261613861656264636462323465626165633632666537223b733a33323a226536363339646232623534313261643134353634613961366634346137393434223b733a33323a223835613262313361363633366132366338616566346363363735396466376634223b733a33323a226161656331626632616231323032363035373738636163383262613433316139223b733a33323a226530666236386638613030363231376230363139356234623938643836633837223b733a33323a223935633163363533636433643361373034366365626663393664623634656533223b733a33323a223230616634656566323231366330316335376339303634653231623135376138223b7d733a343a2268617368223b733a36353a2232306166346565663232313663303163353763393036346532316231353761382d3935633163363533636433643361373034366365626663393664623634656533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1698404851),
('fuo6pabhtkrksebv28o2qgbim9', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393238313335302e3735383035333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266756f3670616268746b726b7365627632386f32716762696d39223b7d7d, 1699281357),
('hb986rv4ab7bji4r3kh7nfj46c', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393836343037322e3532343737313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d366c38346668737267753671626e646e656169306931766273223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393836373535353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393836373634333b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313639393836373637323b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223765363265636530346439396130646338373138356136613434333865613233223b733a33323a223965353830363031313331616562366536616533393665363763623438323631223b733a33323a223238323532346263643430333264343838613263363431326164393632356138223b733a33323a223462396636303538326563623835376333343731636465333538666133656232223b7d733a343a2268617368223b733a36353a2234623966363035383265636238353763333437316364653335386661336562322d3238323532346263643430333264343838613263363431326164393632356138223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223366366636373233613736313361633835393034363936613366613039316134223b733a33323a226338343537616632353935653734653763646164333666663037633963383231223b733a33323a223539666230323832373833336236323236313465303466343933343664663030223b733a33323a226239656130376638383931313535383031313162393938356539303632633639223b733a33323a223538666361376261323562363333636633306637313264373037313432656533223b733a33323a226165316139316662636362643839343266316636373933386365326138313132223b733a33323a226365373965626230313833633730383131653161343132393332306664636265223b733a33323a226630343038376639613733653865346663646163353338386130343534366665223b733a33323a223036663937383562346435393936363935373030333066633064613463386363223b733a33323a226666303139636633613039333534306265303538303933646565376236333665223b733a33323a226636313634363462323535313931653637613034316632326235373265303466223b733a33323a226532666632616635343261383766353935333639646663346233326335316335223b7d733a343a2268617368223b733a36353a2265326666326166353432613837663539353336396466633462333263353163352d6636313634363462323535313931653637613034316632326235373265303466223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223530393863343363666530663238653663323332363963636161353865333335223b733a33323a226365643130313237323061323734646563653866353738393935623535323336223b733a33323a226230386462333535303439323635346331343366393330353030376437343138223b733a33323a223361623463333562343136393662366434636538633631613938373836383730223b7d733a343a2268617368223b733a36353a2233616234633335623431363936623664346365386336316139383738363837302d6230386462333535303439323635346331343366393330353030376437343138223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1699864072),
('hf8afvvj0matfambkl4d6g6l9m', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313936323036332e3139393136393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274646768737071636d6d7136697264713034747075686f363332223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313935303334313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313935323033313b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313935323131313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313936353636333b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223264613530353530623365306533386366636135396332616136616662343963223b733a33323a226364363939353065373465656134663933616234653261306535343935386238223b733a33323a223332353761663163616564323661666632336363333165393134336237366566223b733a33323a223532373832376538613331373565303436633363323235383135636239636236223b7d733a343a2268617368223b733a36353a2235323738323765386133313735653034366333633232353831356362396362362d3332353761663163616564323661666632336363333165393134336237366566223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226233636261343665316233316566653236303561313666323531646536323633223b733a33323a223631663231633965323162343265613164333038393138616364336436363861223b7d733a343a2268617368223b733a36353a2236316632316339653231623432656131643330383931386163643364363638612d6233636261343665316233316566653236303561313666323531646536323633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226264323139643733636464333930373432323632333631626462613261346532223b733a33323a226365663136383666306535343132656162373461363062663363653839616263223b7d733a343a2268617368223b733a36353a2263656631363836663065353431326561623734613630626633636538396162632d6264323139643733636464333930373432323632333631626462613261346532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35363a7b733a33323a226265363663303130383335663966626633626234646264396636663965653733223b733a33323a226430646534316336623064623233633566343934323266346439306533363066223b733a33323a226662663235366337386139313765663366393236343663623033633733393932223b733a33323a223361383262623833383331343330633462623139643464363862326538316631223b733a33323a223939616364653634373561623334613438366632323037326335336333353962223b733a33323a223462663761353536636431613334643038393038393336646431363539336364223b733a33323a223838323862633539643136393239303564646261316237376564363435386133223b733a33323a226334373266613864373532323630306362613966643034363333386339343763223b733a33323a226265376231356261393462613363626261316635336634396133633961623437223b733a33323a223736396662613831613566666231393939313935336165313539383031336631223b733a33323a226633393731653864643838383737633662643564326264623630383764303764223b733a33323a223538363033383834376562306564353361346263383364636430333436353137223b733a33323a226665356266626232623835653830306162653565636261393462633731353234223b733a33323a226632393539373136376532616232303334373534366336613561313761336465223b733a33323a226330626536386637326237396461336633313736343734326331646166366133223b733a33323a223539666439326432313766383365366232343536656539623061633830306532223b733a33323a223264366631663437363666373734626533346561313833343531623962643161223b733a33323a226466316439663462373936383165393762373136373435303133633135616538223b733a33323a226562623565306265303864366534366464626636626266333263336165366639223b733a33323a226339633665616666623066613863366434313766363335303136383531363961223b733a33323a223764303937636261343261353530666538313938353430383165346136333563223b733a33323a223661313833633435323766343266313264303330356462346436343139353962223b733a33323a223731623037306562353165326161663834393034636465383365626634336238223b733a33323a226437326335633265626634666666653639373236653966313233303864356535223b733a33323a226238626662303038313339393839663362653963383933363663346163356334223b733a33323a223331643038376332653634333935666138356138636633343166633938646466223b733a33323a223762393764643330366536383732366137326334626634303566636337336366223b733a33323a226164313235663530643532666161613261343766666434636136626662373134223b733a33323a226439386237653531366334626638656332316162393762333932656662383134223b733a33323a226130353562376132323830356432353136383831646464366238313265376663223b733a33323a226335363233383335313666646565333263363562656661366537613031323134223b733a33323a223665313136663163393431623030316631306539643531613566643863326563223b733a33323a226239333638306365623266656638633531393132643237326461623434326464223b733a33323a223763636665663334646439303638663465643036356635323063393335373639223b733a33323a226464313133643462326339663162393639643932396234313266623463373831223b733a33323a223737633130303338363566633538636338323161356630653466333865396538223b733a33323a226439386665333536623232336461303536666337313261656432373762313061223b733a33323a226631646265363038663361663537306238376264623737636465363337646337223b733a33323a226165346665316131333564653734333237306536626438376536613237626339223b733a33323a223336383362643531366533323935663539383563346439323434366139613032223b733a33323a223930663138326533666234653338643935383266323834326134633861333861223b733a33323a223832343832613862373935303432656237376663303132653264653834336134223b733a33323a223439623436316237653834343036636461653236303632653736363264666365223b733a33323a223737376663376231366135633734313931613838656234313531343631303564223b733a33323a223564313363346336623032393634313439306433613833376266326562613632223b733a33323a223334333066383863633935396234396564393765373633343565326134363639223b733a33323a226638663430333038353862623561653036653135346538666638396366326561223b733a33323a226338636231626365393030323662386432343633316366386166636633313233223b733a33323a226130663433326461303535373036356265323239643734386162393237333232223b733a33323a226264383834643161323162333031373934623363323831643235633630323762223b733a33323a223834363231653839663736343334333031336364316537626238346635353433223b733a33323a226366376164376464646133313533373464656232636130643062383134646362223b733a33323a223462303039313965356666323732643766346239623735396339313930323861223b733a33323a226532346563343836353538356564626633643138383535613266626139656364223b733a33323a223663616232356562613466653237363032366565323136303936396130626434223b733a33323a226236623434393439623965333031326662653134316536646630616666643161223b733a33323a226364643861643533623436626637306564656364306431393332386533343563223b733a33323a223534346234643630323965653836353137663532323835326532623431643161223b733a33323a223365383862336439393839613432356439343635653133656366376132636533223b733a33323a223338653439633635353739636437313533633766323436373732323433353464223b733a33323a223362633437366363663631346265333165356634326164343330343738623461223b733a33323a223163356166316437333034353132663635303231353234363937653834333133223b733a33323a223730633866323032336665303838323863343535383763363430616333343338223b733a33323a226236646363373334303431313232326264323964643236376332333063393634223b733a33323a226665326665313565343836306664303163333765333336613661396531396266223b733a33323a223333363030333835316536336136653061663163653330396631363233393938223b733a33323a226439666138633233663337373734626439373135626235326634303361656638223b733a33323a223636623337613938323566303037653864326439396135653437356138386536223b733a33323a226664333637343564626632646631656538626266313734653635393034386331223b733a33323a223264356537633034313835376666313237306261653464623236386635353338223b733a33323a223764373735613336396664313264306531303031376538373365633531643838223b733a33323a223864613337663338666637643835303237373732393165366539666261393865223b733a33323a223465366330323434323036653762393634336462643466376338373333346430223b733a33323a223634333337663839633931646135663265393437663866663063323364363030223b733a33323a226262366466343431656638633661653834323337376363376239623162363933223b733a33323a223438643836383330343039346164363834653461626163613738353736643039223b733a33323a226133303936353334303464303930376638383233636630303562306233323232223b733a33323a223432343933306639326166353337623061653932393362396139626565633037223b733a33323a223233363638373738663966373961353962336134353863333234366262306139223b733a33323a223835643731323866393538326434343561643665316135386430346134613937223b733a33323a226635383263383638323935336363663332343565616335663738653933336666223b733a33323a226564363637643237653237636666313636633537653166373533313038613266223b733a33323a223538396334396163326466306165353032313237653533643333383862643265223b733a33323a223731323562623632326563363834353762303464393766646332623538633665223b733a33323a226235356339323563303162623033366633376463343731313530646261666266223b733a33323a223764313561333232393034353365663339303831333237373039626337323838223b733a33323a226132323832653230623334633834366662656636393436323638333436643837223b733a33323a226534323933663133653964663863643664346133306235373538313664333063223b733a33323a223231646638633931633634663136643835386134323734353531366538656361223b733a33323a226166663264366461616361346631336264323837313464363531383332633538223b733a33323a223462313765656166356430343930643434613439383131333037636361353033223b733a33323a226563393438663234303737643735346439663364316130363930626336616137223b733a33323a223766313564666361373565666137323333333931333663646337663364613239223b733a33323a226632373335386636326632346135323065396261353135623762616563306166223b733a33323a223664393963386438333539336663323162373033646161383335383933336535223b733a33323a226537373466373263393165313262356530316434653336366265323036303939223b733a33323a226332666233343464653366346432613764356161636236616434663332383264223b733a33323a223364363262363534343138653835613634353563363566326332653832383933223b733a33323a223537333863666333316338336436396662616232333236333834643233633261223b733a33323a223166343435326165343135623262653064653836323031313637653232656631223b733a33323a223236366135303030633165653337383631396333316332623531646165633665223b733a33323a223030333938626430663838356263323537396439373865616634616533333265223b733a33323a223730626666373365393637323539386339336266623235636133363432643338223b733a33323a226362396463343863303333303632356662653864613666643336363265363663223b733a33323a223032373838643465376634386361306637326336336530373961643064346338223b733a33323a226134393333656138663237636335393734353664363537303932306530636130223b733a33323a223434376432383831343062663835616338616331373031306338383762386330223b733a33323a226237363337356265646430613763343839623766633533316535656163333763223b733a33323a223536646138386439373664636564393738376132623364646261313236306235223b733a33323a226562363336663336633631343736653138653731643764643363363735323062223b733a33323a223863663039663638386630363062646564633639656366366230373266396165223b733a33323a223633326265313138326136333264613465346338386531316634323134366131223b7d733a343a2268617368223b733a36353a2236333262653131383261363332646134653463383865313166343231343661312d3863663039663638386630363062646564633639656366366230373266396165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701962063),
('l72neetiboa9c2an241gpc9fhh', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313038393637382e3631343234393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22333072766136316172346c386e646e7630363264746766307030223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039313531323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730313039333237353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313730313039323933353b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223361333032373136636563636239656435366536313666643636653332353731223b733a33323a226530636666343932373235343132333536333363663762653637333665666462223b7d733a343a2268617368223b733a36353a2265306366663439323732353431323335363333636637626536373336656664622d3361333032373136636563636239656435366536313666643636653332353731223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a226364326138306632353239366438303630333961623039393261306437303633223b733a33323a226536366334656132336666303031386232306531343933306664663161616431223b733a33323a223033303162653134663031346238666165303966353039626462346161643963223b733a33323a223230383864653235343830616162373132646630323231396165636334343035223b733a33323a226464623062626161653938353932353038383261626265646466363737373839223b733a33323a226330666663316537303565636364306265353838356538653435383430303432223b733a33323a223234643435376535333432386564653161326238376466663537323538383164223b733a33323a223265356131326264336331373134626465383166383031323439656630363662223b733a33323a223363663738666230353566346231333564373964313365373534373364643837223b733a33323a223935636335353834383465383239343461386632373465303638666462613333223b733a33323a223766303164306439396163666530613437613566653066366138343030326361223b733a33323a223364313232343466333166613933323034316136373063656664383163616562223b733a33323a223039323936393533623834643165623966373831656435373136663662303563223b733a33323a223165396530623434306465396666356638306564613632323138646133616534223b733a33323a223030353863353862383233333362663962386232323432646466633963646235223b733a33323a223565653232613530303436333036613834366337366434303365393635303565223b733a33323a226562326633363330353862393635313365336330666530303731633632323634223b733a33323a226436393963306266383638626534666665613134396166313532623061306233223b733a33323a226233323933336634333634346332646163363339396365346531373762366239223b733a33323a226130313564366338643036626431356566383737356131323833373261653430223b7d733a343a2268617368223b733a36353a2261303135643663386430366264313565663837373561313238333732616534302d6233323933336634333634346332646163363339396365346531373762366239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223633363464383563663132303964313133663933396333643666636632623539223b733a33323a223936396461373262356462636136303535303732613038386238303037353937223b733a33323a223035326331366662653964353066633162303038353564643238356530633464223b733a33323a226630316266353535396139623039313738626238363537303633303239303164223b733a33323a223061393466376361643534393864363265353065306638396232636137306336223b733a33323a226139636366646334303962666235653735386435303733346537643234633736223b733a33323a226163383337373635643739303938626362313039656230343632666638666437223b733a33323a226438393438303864643832306265346633313862376439353439336439396236223b733a33323a223130323439386230616333303263343533666639376262623935653531666365223b733a33323a226633316237373664336230613665636561643737303831373039363836303863223b733a33323a226234346430313030353133643363643238326630303031633266353637303561223b733a33323a223233373638363430343364636136316537373065626363663431333831393831223b733a33323a226437373966613363396565626136356164386433643539373465383130393134223b733a33323a223235326432666563366533623535376635336237616365346236366431326435223b733a33323a226537616561663734313066623963363361326637363065323535396639616364223b733a33323a223533656363386637383035613532333537386537666262363363366638346433223b733a33323a226634653763653231626238343061653362393830663636656232663632386331223b733a33323a223863393838646161313731393066656237383938313061613730656638653735223b733a33323a223839353234613365316164663337343230323230316539666338643434666363223b733a33323a223833313936616366303365336165643236326133616466383932666438306235223b7d733a343a2268617368223b733a36353a2238333139366163663033653361656432363261336164663839326664383062352d3839353234613365316164663337343230323230316539666338643434666363223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1701089678),
('lkklpblg18d6fjohstnphvghcv', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303734303530302e3830323435313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22323370636d62346636696b6f3530353069767530346167636e71223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303734313231333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303734343039393b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223332333166383865613730303465343433386161386566653866633836323435223b733a33323a223364663066333039336263363634333938363163363738363237656234656534223b733a33323a223734643037373734306534346161393933303934333765333064363265356364223b733a33323a223232623563386136356134393066393732316365353866623466303033383665223b7d733a343a2268617368223b733a36353a2232326235633861363561343930663937323163653538666234663030333836652d3734643037373734306534346161393933303934333765333064363265356364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a223065653834333863366335333164303836633762383430313030613532646661223b733a33323a226237643835353564353839626534306634316163663661636365666638353137223b733a33323a223264353033353338613431623438633130613066343339613230323938666238223b733a33323a223036363863663563316332653532363530666163353638316132626564356334223b733a33323a226438633636623530663239313536653162343063303263356634343136616664223b733a33323a223639636263316363393538303163336232343036313161326335623530666466223b733a33323a226231363434333764336438666663373136316436643632303764346363633566223b733a33323a226138383962353961663264333030326330333165643735383831633761613561223b733a33323a226633373166653265373139376661386635303331383037336435316466653566223b733a33323a226339666435303666363139656634313933396231383830316462626264313938223b733a33323a223264316536376633613438623664653438303738363664623265383438373630223b733a33323a226531316434376136653662333134646665613831663635666262653834323763223b733a33323a226536326338646361353730316233396530613731386632363032626163653562223b733a33323a226630333966323737646134666232633235336366323833636664363937653730223b733a33323a223664646436393235396235623438356663613836663531343866376561393934223b733a33323a223566643561346462303765333162363563663735363265333264333264303363223b733a33323a223064326666366632356636313061323935633465346534393930376235353561223b733a33323a223438316361303131333439353639396531383734393239363865356137376162223b733a33323a226433373238353333343633353264666366656363376231333463343930306433223b733a33323a223037626564373139393466383938323464663535323537636638323831303534223b733a33323a226237666236303437393766376161346266663531663331616666343533613439223b733a33323a223037343666306639653236646137333137356662326332343035666538656135223b733a33323a223431313162356163636439633937366665666463343036346236356133633131223b733a33323a226530353732333063656262633535323133633963333733333862326466373334223b733a33323a223436643166373233393266656430376332393632353564643330653263313535223b733a33323a223938396536346136303634396363326564386365303935643862613533383739223b733a33323a223762353637306438636539663161623333356536323737353634346663393336223b733a33323a223133353230396433653032326461343934353431343561343361633263353431223b7d733a343a2268617368223b733a36353a2231333532303964336530323264613439343534313435613433616332633534312d3762353637306438636539663161623333356536323737353634346663393336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1700740500);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('lmp11d89o0bh8d348shv8lqh06', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639393238313439352e3338313035343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22337066396e6d657366746669667032396b373469393072363830223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393238343936373b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393238353039343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639393238353038313b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226233346531306464373062616530373361373835333962306632356234376663223b733a33323a226462333336303065663032306138333461376662316134303435666332346332223b733a33323a226262356137373365626639663063356631393863393730626432323231376465223b733a33323a223236336133666565373234323532386137386139626364616537653561306234223b7d733a343a2268617368223b733a36353a2232363361336665653732343235323861373861396263646165376535613062342d6262356137373365626639663063356631393863393730626432323231376465223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226266326438646566313232333266333664303935306266653738613563393266223b733a33323a226461333737623630656163383465613362313462313239303863383664616464223b733a33323a223762363266306563316233623937313961643338613463643639303238613231223b733a33323a226331333963343734613237666561633038326266343038393538333634393162223b733a33323a226236396463353036643737653639313934613439623539663063656632313237223b733a33323a226161613431316365643632653432383064383236316364366432633463613434223b7d733a343a2268617368223b733a36353a2261616134313163656436326534323830643832363163643664326334636134342d6236396463353036643737653639313934613439623539663063656632313237223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223433313837666364303731363431376331323264343939353935353937656562223b733a33323a223663393633356165373763376334646637376533623737636365323132343137223b7d733a343a2268617368223b733a36353a2236633936333561653737633763346466373765336237376363653231323431372d3433313837666364303731363431376331323264343939353935353937656562223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1699281495),
('mbh4js84gc15dpsosh6ep53h9v', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313639383331323237312e3333343134313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326b6976626e6d72723131746972696e31736b666d6d616a3835223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383330383930393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313639383330393839313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313639383331343032323b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223262616166656338646430323162353239613437373235343733306166333338223b733a33323a226131633431303932303735363965383132613333326466353936326164313164223b7d733a343a2268617368223b733a36353a2261316334313039323037353639653831326133333264663539363261643131642d3262616166656338646430323162353239613437373235343733306166333338223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223863313730316161303934386533656466336164336362646639623462373364223b733a33323a226562346364303564373432303039633730323264303865643939396237643265223b733a33323a223330373334616630653537313665353336313431316636653030326337643931223b733a33323a223236363737326261666362383336663833623436353135393165626138623461223b733a33323a226665643036343736386339393866393761646265353535626361643030656630223b733a33323a226262626339326462356664396634326166633366653336346264643535346664223b7d733a343a2268617368223b733a36353a2262626263393264623566643966343261666333666533363462646435353466642d6665643036343736386339393866393761646265353535626361643030656630223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223564666262313762663030653233346261306336653033316463656430356135223b733a33323a226233623262366564363433383234303337636664366435626466663231353435223b733a33323a223833653832653265363236656562616139626231633032323139663831643565223b733a33323a223966653038643733303736396330366331613839356231623539353237383332223b733a33323a223635386261313432373831323762646436366537633965646335613431393035223b733a33323a223433326132663861303863666662613032653163643337646261303661333334223b733a33323a226561376439656666626333386161313937396166656534626136383766653062223b733a33323a223835376563636436636530363730386435643163323137626138656131343130223b733a33323a223434383137353238643132376234636336623863353464366166316664663639223b733a33323a223939313630663135383430656230643137623930643436316436663732343833223b733a33323a226236633735353964653566376261633138356537616430346332666166636234223b733a33323a226165373734656137333563313032626665316261393237316339663065313864223b733a33323a223661323032316234656539303263336261363662643939653832366237303139223b733a33323a223963643632326531663537653436323435306235303332343336643431623439223b733a33323a223831653062356437356436396634656134396235303731306364613139613865223b733a33323a223664326638613838663830636132306434313430356463313861393761373334223b7d733a343a2268617368223b733a36353a2236643266386138386638306361323064343134303564633138613937613733342d3831653062356437356436396634656134396235303731306364613139613865223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1698312271),
('nlenms1tu2v0voa1ekmoi1d46n', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303636353135332e3832383032363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6c656e6d73317475327630766f6131656b6d6f69316434366e223b7d7d, 1700665156),
('p0g8ongpnb5vgtue54gnaqoolo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313934363733312e3538383835383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22703067386f6e67706e623576677475653534676e61716f6f6c6f223b7d7d, 1701946734),
('ticmjeok8pgmrb60chmgd7p2g7', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730313934363733312e3538383835383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a227469636d6a656f6b3870676d7262363063686d67643770326737223b7d7d, 1701946734),
('v5iks07si3toj8p520vhb0q01s', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313730303438333830302e3231303438353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265736537336b766c616d6e6f68366d343773706e766371746835223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437333133383b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437393731303b7d733a34373a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437393437383b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437393736353b7d733a36353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313730303437393737313b7d7d72656469726563745f75726c7c733a33313a2268747470733a2f2f736974652e746573742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223239323266323765383438363136336666393565376161333637613035623965223b733a33323a223061316131393435336137343635653139363866303434663766343964323830223b733a33323a223839343532306132393532363032616332353835613564373862303361313831223b733a33323a226234323037336439633936386665653834363930393538383031336438303062223b733a33323a223465363862613332333561303639323966613434396464636637376462666633223b733a33323a223330353764666631326566643461336561353237303463613539643631306637223b7d733a343a2268617368223b733a36353a2233303537646666313265666434613365613532373034636135396436313066372d3465363862613332333561303639323966613434396464636637376462666633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223133646130383663353438303964323137633762643934616365393232333064223b733a33323a226538656663616636643832313663633038376234633863373036336430616130223b7d733a343a2268617368223b733a36353a2265386566636166366438323136636330383762346338633730363364306161302d3133646130383663353438303964323137633762643934616365393232333064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226130356230656435643634636238366163353763656634656331633961323535223b733a33323a223662623435616437653230303265346330313365393364646238653534383466223b733a33323a226136343536316439393230343163376531653237633466323131386265636231223b733a33323a223462336232333739613564353438336636326232646465643464393961616233223b7d733a343a2268617368223b733a36353a2234623362323337396135643534383366363262326464656434643939616162332d6136343536316439393230343163376531653237633466323131386265636231223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223765613262376133386361663132303634323537383664326463643664316139223b733a33323a226164646337666438346334353235613139373132613237383231646462653864223b733a33323a226162343166393931383363306332333662663964623634646265366664343133223b733a33323a223465613333336466613137393731323034303839363233323230306335616339223b733a33323a223233373462306661343330396635383735353431346135316162653637633762223b733a33323a223939363663666461363638386232396661373739353331313966663262316531223b733a33323a223363303932643833343261323966643731656436646234353035336535613461223b733a33323a223664653433366564313139333732623133626236646434316163343833626631223b733a33323a226339626131656337613766346262663762326363613632346536613161626165223b733a33323a226231663832326139636433643965613464383264336336363064356463313630223b7d733a343a2268617368223b733a36353a2262316638323261396364336439656134643832643363363630643564633136302d6339626131656337613766346262663762326363613632346536613161626165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226264303065623766383161346138383831613730366239363262313866363638223b733a33323a226434626162633064393239656238396137373739633430313132323035623966223b733a33323a226435363964396131363162333334376235343638623234323834356565353963223b733a33323a226336376561646662623061303034333836303134613766633338333035313261223b733a33323a226466306563653238333431643864613037353430343036666139316365376530223b733a33323a223932363365303163643439323861623538336239303730313235656165326665223b733a33323a223533656335653536393735303330353331303534383035633934363163346136223b733a33323a223962616630376132633039356330656265663363653639366538343064383239223b733a33323a223331386537633631353137636331353131643261366438613261653630316630223b733a33323a226231623733323231343937666138343238356162656432323939316664303939223b7d733a343a2268617368223b733a36353a2262316237333232313439376661383432383561626564323239393166643039392d3331386537633631353137636331353131643261366438613261653630316630223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1700483800);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"he.laurent.1130@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"HelloOmekaS\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Berlin\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.0.4\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'he.laurent.1130@gmail.com', 'admin', '2023-10-26 07:28:29', '2023-10-26 07:28:29', '$2y$10$3dnY98YBheuVpxJcpuVOdOkqYeXZalbNBlmgzG43my5HGnvXZbLzC', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'The best professor', '2023-11-27 12:27:22', '2023-11-27 12:28:08', '$2y$10$PThAWyIcCEq3Mln9yjU5eubKT3Guag9B9lrORa7x93J27/asjhR26', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(107, 23, 228, NULL, NULL, 'literal', '', 'Toto', NULL, 1),
(108, 23, 229, NULL, NULL, 'literal', '', 'Tata', NULL, 1),
(109, 23, 230, NULL, NULL, 'literal', '', '1', NULL, 1),
(110, 23, 232, NULL, NULL, 'literal', '', '22/11/1999', NULL, 1),
(111, 23, 231, NULL, NULL, 'literal', '', 'FR', NULL, 1),
(112, 24, 233, NULL, NULL, 'literal', '', 'Tennis', NULL, 1),
(113, 25, 238, 24, NULL, 'resource', NULL, NULL, NULL, 1),
(114, 25, 237, 23, NULL, 'resource', NULL, NULL, NULL, 1),
(115, 25, 236, NULL, NULL, 'literal', '', '19/12/2023', NULL, 1),
(116, 25, 235, NULL, NULL, 'literal', '', '42', NULL, 1),
(117, 26, 228, NULL, NULL, 'literal', '', 'Baba', NULL, 1),
(118, 26, 229, NULL, NULL, 'literal', '', 'Bobo', NULL, 1),
(119, 26, 230, NULL, NULL, 'literal', '', '0', NULL, 1),
(120, 26, 232, NULL, NULL, 'literal', '', '11/11/1998', NULL, 1),
(121, 26, 231, NULL, NULL, 'literal', '', 'France', NULL, 1),
(122, 27, 238, 24, NULL, 'resource', NULL, NULL, NULL, 1),
(123, 27, 237, 26, NULL, 'resource', NULL, NULL, NULL, 1),
(124, 27, 236, NULL, NULL, 'literal', '', '19/12/2023', NULL, 1),
(125, 27, 235, NULL, NULL, 'literal', '', '40', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(9, 1, 'https://jo.univ-paris8.fr/jo#', 'jo', 'Résultats des sportifs aux jeux Olympiques', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190));

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190));

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
