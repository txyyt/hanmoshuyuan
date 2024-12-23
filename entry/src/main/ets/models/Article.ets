import { cloudDatabase } from '@kit.CloudFoundationKit';

class Article extends cloudDatabase.DatabaseObject {
  // 指定数据库中对象类型的名称
  public naturalbase_ClassName(): string {
    return "Articles"; // 对应数据库中的 objectTypeName
  }

  // 以下字段需与数据库中的字段名保持一致
  public article_id: number | undefined;       // 主键，自增
  public title: string | undefined;           // 文章标题
  public author: string | undefined;          // 作者
  public publish_date: Date | undefined;      // 发布时间
  public content: string | undefined;         // 文章内容
  public cover_image: string | undefined;     // 封面图片链接
  public read_count: number | undefined;      // 阅读量
}

export { Article };
