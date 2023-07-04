

/**
 * List item data entity.
 */
export default class PageResource {
  /**
   * Text of list item.
   */
  isLike:boolean
  isCollect:boolean
  img1: Resource;
  name?: string
  /**
   * Image of list item.
   */
  date?: string;
  img2?: Resource
  /**
   * Other resource of list item.
   */
  num1?: number;
  num2?: number
  num3?: number

  constructor(isLike:boolean,isCollect:boolean,img1: Resource, name?: string, date?: string,img2?: Resource,num1?: number,
              num2?: number,num3?: number) {
    this.img1 = img1;
    this.isLike=isLike
    this.isCollect=isCollect
    this.img2 = img2;
    this.name = name;
    this.date = date;
    this.num1 = num1;
    this.num2 = num2;
    this.num3 = num3;
  }
}