
import CourseModel from './CourseModel';

/**
 * course classity model
 */
export default class ClassifyModel {
  /**
   * classify id
   */
  classifyId: number;
  /**
   * classify name
   */
  classifyName: string;
  /**
   * course list of the classify.
   */
  courseList: Array<CourseModel>;
}