class News {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<Results>? results;

  News({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  News.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        next = json['next'] as String?,
        previous = json['previous'],
        results = (json['results'] as List?)?.map((dynamic e) => Results.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'count' : count,
    'next' : next,
    'previous' : previous,
    'results' : results?.map((e) => e.toJson()).toList()
  };
}

class Results {
  final int? id;
  final String? title;
  final String? url;
  final String? imageUrl;
  final String? newsSite;
  final String? summary;
  final String? publishedAt;
  final String? updatedAt;
  final bool? featured;
  final List<Launches>? launches;
  final List<dynamic>? events;

  Results({
    this.id,
    this.title,
    this.url,
    this.imageUrl,
    this.newsSite,
    this.summary,
    this.publishedAt,
    this.updatedAt,
    this.featured,
    this.launches,
    this.events,
  });

  Results.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        url = json['url'] as String?,
        imageUrl = json['image_url'] as String?,
        newsSite = json['news_site'] as String?,
        summary = json['summary'] as String?,
        publishedAt = json['published_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        featured = json['featured'] as bool?,
        launches = (json['launches'] as List?)?.map((dynamic e) => Launches.fromJson(e as Map<String,dynamic>)).toList(),
        events = json['events'] as List?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'url' : url,
    'image_url' : imageUrl,
    'news_site' : newsSite,
    'summary' : summary,
    'published_at' : publishedAt,
    'updated_at' : updatedAt,
    'featured' : featured,
    'launches' : launches?.map((e) => e.toJson()).toList(),
    'events' : events
  };
}

class Launches {
  final String? launchId;
  final String? provider;

  Launches({
    this.launchId,
    this.provider,
  });

  Launches.fromJson(Map<String, dynamic> json)
      : launchId = json['launch_id'] as String?,
        provider = json['provider'] as String?;

  Map<String, dynamic> toJson() => {
    'launch_id' : launchId,
    'provider' : provider
  };
}